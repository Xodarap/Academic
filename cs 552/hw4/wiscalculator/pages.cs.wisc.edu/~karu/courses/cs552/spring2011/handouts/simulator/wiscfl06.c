/* Simulator/Debugger for WISC-FL06 architecture
 *  
 * Derek Hower
 * University of Wisconsin-Madison
 * 14 Nov 2006
 */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <math.h>
#include <readline/rlconf.h>
#include <readline/readline.h>
#include <readline/history.h>

#define TRUE 1
#define FALSE 0

/* memory size, in bytes */
#define MEM_SIZE (0xFFFF) 
#define TEXT_START 0

/* globals */
unsigned char IMEM[MEM_SIZE];  // instruction memory
unsigned char DMEM[MEM_SIZE];  // data memory
unsigned char DMEM_VALID[MEM_SIZE]; // location valid flag
int LARGEST_ADDRESS_D = 0;  // stores the largest address written to D mem
int LARGEST_ADDRESS_I = 0;  // stores the largest address written to I mem
int check_alignment = 0;

/* decoded state */
unsigned int IR; 
unsigned int RS, RT, RDI, RDR, IMM5, IMM8, DISP, EXTOP;  // instruction bits

/* 8 general purpose registers */
#define NUM_REG 10
unsigned int REG[NUM_REG];
#define R0 0
#define R1 1
#define R2 2
#define R3 3
#define R4 4
#define R5 5
#define R6 6
#define R7 7
#define PC 8
#define EPC 9

/* 
 * Setting DEBUG = TRUE causes diagnostic output to be printed.
 */
#define DEBUG FALSE

/*
 * SHOWINST used to determine if instructions should be displayed as they are exectued.
 * The option -p will force SHOWINST = TRUE.  Stepping also forces TRUE.  
 * On normal operation, SHOWINST defaults to FALSE
 */

int SHOWINST = FALSE;

/*
 * EXIT is set when either the program halts or an error occurs.
 * Execution stops when EXIT is true.
 */
char EXIT;   //bool

/* 
 * WORD_SIZE stores the number of bytes in a word for this architecture
 */
#define WORD_SIZE 2

/*
 * BREAK stores the breakpoints as defined by the user.  
 * BREAKSIZE keeps track of the number of breaks currently active
 */

unsigned int BREAK[100];
int BREAKSIZE;

int dest_reg;
int dest_val;
int dest_addr;
int dest_mem_val;

/*
 * Resets all registers to 0, and PC to the start of the text statement. Function is called
 * before a read from file so that the program can be reset.
 */
void clearRegFile()
{
  int i;

  REG[PC] = TEXT_START;
  REG[EPC] = 0;
  
  for(i=0;i<NUM_REG;i++)
    REG[i]=0;
}

int GetLine(FILE *fp, char *Buffer) {
	while ((*Buffer = getc(fp)) != EOF) {
		if(*Buffer++ == '\n') 
			{*(--Buffer) = '\0'; return(1);}
	}
	return(EOF);
	
}

/*
 * Getline function for file I/O
 */
static char *command = (char*) NULL;
char* GetCommand() 
{
  /* If the buffer has already been allocated,
     return the memory to the free pool. */
  if (command)
    {
      free (command);
      command = (char *)NULL;
    }

  /* Get a line from the user. */
  command = readline ("WISC% ");

  /* If the line has any text in it,
     save it on the history. */
  if (command && *command)
    add_history (command);
  return command;
}

/*
 * Write a word to instruction memory.
 * Checks for an error on either an unaligned access or an address out of bounds
 * Updates the LARGEST_ADDRESS_I variable if needed
 */
void WriteIMemory(unsigned int address, int value) {
  if(address+1 >= MEM_SIZE || address < 0){
    fprintf(stderr,"\nERROR: loadfile specifies an address out of range: 0x%04x\n",address);
    EXIT=TRUE;
    return;
  }
  if(check_alignment & (address&1)) {
    fprintf(stderr,"\nERROR: unaligned memory access.  tried to write 0x%04x from IMEM\n",address);
    EXIT=TRUE;
    return;
  }
  if(DEBUG) printf("writing 0x%x to memory at 0x%x\n",value, address);
  IMEM[address] = (char) ((0xFF00&value)>>8);
  IMEM[address+1] = (char) 0xFF&value;
  if(address+1 > LARGEST_ADDRESS_I){
    LARGEST_ADDRESS_I = address+1;
  }
}

/*
 * Write a byte to instruction memory
 * Checks for address out of range error
 */
void WriteIMemory_8(unsigned int address, int value) {
  if(address+1 >= MEM_SIZE || address < 0){
    fprintf(stderr,"\nERROR: loadfile specifies an address out of range: 0x%04x\n",address);
    EXIT=TRUE;
    return;
  }
  if(DEBUG)printf("writing 0x%x to memory at 0x%x\n",value, address);
  IMEM[address] = (char) 0xFF&value;
}

/*
 * Write a word to data memory
 * Checks for an error on either an unaligned access or an address out of bounds
 * Updates LARGEST_ADDRESS_D variable
 */
void WriteDMemory(unsigned int address, int value) {
//  if(address+1 >= MEM_SIZE || address < 0){
  if(address < 0){
    fprintf(stderr,"\nERROR: instruction specifies an address out of range: 0x%04x\n",address);
    EXIT=TRUE;
    return;
  }
  if (address+1 >= MEM_SIZE) {
    address = (address & 0xffff);
  }
  if(check_alignment&(address&1)) {
    fprintf(stderr,"\nERROR: unaligned memory access.  tried to write 0x%04x from DMEM\n",address);
    EXIT=TRUE;
    return;
  }
  if(DEBUG) printf("writing 0x%04x to memory at 0x%x\n",value, address);
  DMEM[address] = ((0xFF00&value)>>8);
  DMEM[address+1] =  0xFF&value;
  DMEM_VALID[address] = 1;
  DMEM_VALID[address+1] = 1;
  if(DEBUG) printf("wrote %x (%x) to address+1\n",DMEM[address+1], value);
  if(address+1 > LARGEST_ADDRESS_D){
    LARGEST_ADDRESS_D = address+1;
  }
}

/*
 * Write a byte to data memory
 * Checks for an address out of bounds error
 */
void WriteDMemory_8(unsigned int address, int value) {
  if(address+1 >= MEM_SIZE || address < 0){
    fprintf(stderr,"\nERROR: instruction specifies an address out of range: 0x%04x\n",address);
    EXIT=TRUE;
    return;
  }
  if(DEBUG) printf("writing 0x%02x to memory at 0x%x\n",0xFF&value, address);
  DMEM[address] = (char) 0xFF&value;
  DMEM_VALID[address] = 1;
  /*
  if(address > LARGEST_ADDRESS_D){
    LARGEST_ADDRESS_D = address;
  }
  */
}

/*
 * Read a word from instruction memory.
 * Checks for an error on either an unaligned access or an address out of bounds
 */
unsigned int ReadIMemory(unsigned int address) {
  if(address+1 >= MEM_SIZE || address < 0){
    fprintf(stderr,"\nERROR: tried to read from an address out of range: 0x%04x\n",address);
    EXIT=TRUE;
    return 0;
  }
  if(check_alignment&(address&1)) {
    fprintf(stderr,"\nERROR: unaligned memory access.  tried to read 0x%04x from IMEM\n",address);
    EXIT=TRUE;
    return;
  }
  return 0xFFFF&( ((0xFF&(IMEM[address]))<<8)|(0xFF&(IMEM[address+1])));
}

/*
 * Read a word from data memory.
 * Checks for an error on either an unaligned access or an address out of bounds
 */
unsigned int ReadDMemory(unsigned int address) {
//  if(address+1 >= MEM_SIZE || address < 0){
  if(address < 0){
    fprintf(stderr,"\nERROR: tried to read from an address out of range: 0x%04x\n",address);
    EXIT=TRUE;
    return 0;
  }
  if((address+1) >= MEM_SIZE){
    address = (address & 0xFFFF);
  }
  if(check_alignment&(address&1)) {
    fprintf(stderr,"\nERROR: unaligned memory access.  tried to read 0x%04x from DMEM\n",address);
    EXIT=TRUE;
    return;
  }
  //  printf("adress:%x  add: %x  add+1:  %x\n",address, DMEM[address], DMEM[address+1]);
  return 0xFFFF&( ((0xFF&(DMEM[address]))<<8)|(0xFF&(DMEM[address+1])));
}

/*
 * Dump the contents of instruction memory to fp, up to the largest address written
 */
void DumpIMemory(FILE* fp)
{
  int i;
  for(i=0;i<=LARGEST_ADDRESS_I;i++){
    fprintf(fp,"%i\n",IMEM[i]);
  }
}

/*
 * Dump the contents of data memory to fp, up to the largest address written
 */
void DumpDMemory(FILE* fp)
{
  int i;
  if(LARGEST_ADDRESS_D != 0){
    for(i=0;i<=LARGEST_ADDRESS_D;i++){
      if( DMEM_VALID[i] ){
	fprintf(fp,"%04x %02x\n",i,DMEM[i]);
    }
      else {
	fprintf(fp,"%04x xx\n",i);
      }
    }
  }
}

/*
 * Function ReadHexFile processes the file indicated by filename and loads
 * the contents into both instruction and data memory
 */
void ReadHexFile(char * filename){
	FILE *fp;			/* File descriptor for hex.out */
	int value;
	char LineBuffer[132];			/* Buffer for each line in turn */
	int MemoryCounter = TEXT_START ;	/* Prepare to load starting at */
	int LineNumber = 1;			/*   first code segment location */

	/* try to open hex.out read-only */
	if((fp=fopen(filename,"r")) == NULL) {
	  fprintf(stderr, "ERROR: failed to open %s!\n", filename);
	  return;
	}
	/* begin reading lines from hex.out into code segment, looking for
	 * DATA SEGMENT flag
	 */
	printf("Loading program...\n");
	while(GetLine(fp,LineBuffer)!= EOF) {
	  if(LineBuffer[0] == '@') {
	    MemoryCounter = atoi(LineBuffer+1);
	    if(DEBUG) printf("Moving memory pointer to %i...\n", MemoryCounter);
	  }
	  else {
	    if(DEBUG) printf("Processing line %i, ", LineNumber++);
	    sscanf(LineBuffer,"%x",&value);
	    WriteIMemory_8(MemoryCounter,value);
	    WriteDMemory_8(MemoryCounter,value);
	    MemoryCounter += 1;
	  }
	}
	
}

/*
 * Parses the WISCalculator command prompt and returns a value for proper execution
 * returns integer corresponding to the command, and optionally sets param to a parameter for the command
 */
int parseCommand(char * input, char** param)
{
  int i, argc = 0, j=0;
  char* command;
  char* token;

  *param = "";
  i = 0;
  token = strtok(input, " \n");
  while(token != NULL){
    if(strcmp(token,"")!=0){
      if(i==0) {command = token;}
      else if(i==1) {*param = token;}
      i++;
    }
    token = strtok(0, " \n");
  }

  if(strcmp(command,"l")==0 || strcmp(command,"load")==0)
    {
      if(strcmp(*param,"")==0)
	*param="loadfile";
      return 0;
    }
  if(strcmp(command,"run")==0)
    return 1;
  if(strcmp(command,"d")==0 || strcmp(command,"dump")==0)
    return 2;
  if(strcmp(command,"s")==0 || strcmp(command,"step")==0)
    {
      if(strcmp(*param,"")==0)
	*param="1";
      return 3;
    }
  if(strcmp(command,"h")==0 || strcmp(command,"help")==0)
    return 4;
  if(strcmp(command,"p")==0 || strcmp(command,"print")==0) {
    if(strcmp(*param,"")==0)
      *param="all"; //default to all
    return 5;
  }
  if(strcmp(command,"b")==0 || strcmp(command,"break")==0)
    return 6;
  if(strcmp(command,"r")==0 || strcmp(command,"read")==0)
    {
      if(strcmp(*param,"")==0)
	*param="0";
      return 7;
    }
  if(strcmp(command,"c")==0 || strcmp(command,"continue")==0){
    return 8;
  }
  else
    return -1;
}

void printHelp()
{
  printf("\nWISCalculator v1.0 help\n"); 
  printf("load [filename] -- reads in assmebled binary file \"filename\" for execution.  \n");
  printf("                   If no filename is given, defaults to \"loadfile\"\n");
  printf("run [-p]        -- runs program until breakpoint or halt.\n");
  printf("                   -p will print each instruction as it is executed.\n");
  printf("continue        -- continues execution after a breakpoint \n");
  printf("step [n]        -- steps n instructions. Defaults to n=1\n");
  printf("break [address] -- inserts a breakpoint at specified memory address\n");
  printf("print [n]       -- prints the contenets of the register n, where n is an int\n");
  printf("                   if no argument is given, defaults to a \"print all\" command\n");
  printf("print all       -- print the contents all architecturally-visibile registers\n");
  printf("read [n]        -- read the contents of data memory at address n\n");
  printf("                   n is a number in a hexadecimal format (NO leading 0x)\n");
  printf("dump            -- dump the contents of data memory to <loadfile>.dmem\n");
  printf("help            -- print this message\n");
  printf("\nAll commands except \"run\" can be executed by typing the first letter of the command\n");
  printf("\n");
}

char* formatRegName(unsigned int reg)
{
  switch(reg){
  case R0:
    return "r0";
  case R1:
    return "r1";
  case R2:
    return "r2";
  case R3:
    return "r3";
  case R4:
    return "r4";
  case R5:
    return "r5";
  case R6:
    return "r6";
  case R7:
    return "r7";
  case PC:
    return "PC";
  case EPC:
    return "EPC";
  default:
    return "unknown";
  }
}

/*
 * Formats and prints a register dump
 */
void regDumpFile(FILE* fp)
{
  int i;
  //print globals
  fprintf(fp,"\nPC\t0x%04x\tEPC\t0x%04x\n\n", REG[PC], REG[EPC]);
  
  //print general regs
  for(i = 0; i<8; i++)
    {
      if(i%4==0)
	{
	  fprintf(fp,"\nR%i 0x%04x", i, REG[i]);
	}
      else
	{
	  fprintf(fp,"\tR%i 0x%04x", i, REG[i]);
	}
    }
  fprintf(fp,"\n\n");
}

/*
 * Formats and prints a register dump
 */
void regDump()
{
  int i;
  //print globals
  printf("\nPC\t0x%04x\tEPC\t0x%04x\n\n", REG[PC], REG[EPC]);
  
  //print general regs
  for(i = 0; i<8; i++)
    {
      if(i%4==0)
	{
	  printf("\nR%i 0x%04x", i, REG[i]);
	}
      else
	{
	  printf("\tR%i 0x%04x", i, REG[i]);
	}
    }
  printf("\n\n");
}

void briefregDump()
{
  int i;
  //print globals
  printf("PC: 0x%04x EPC 0x%04x", REG[PC], REG[EPC]);
  
  //print general regs
  for(i = 0; i<8; i++)
    printf("R%i 0x%04x ", i, REG[i]);
  printf("\n");
}

char isBreak(unsigned int address)
{
  int i;
  for(i=0; i<BREAKSIZE; i++){
    if(address == BREAK[i]){
      //      BREAK[i]=0;
      return TRUE;}}
  return FALSE;
}

void Fetch() {
  IR = 0;
  IR = (0x0000FFFF)&(ReadIMemory(REG[PC]));
  if(DEBUG)  printf("Address 0x%04x: Instruction 0x%04x\n", REG[PC], IR);
  REG[PC] = REG[PC] + WORD_SIZE;
}

int Decode()
{
  unsigned int opcode = IR & 0xf800;
  opcode >>= 11;
  
  RS = (IR & 0x00000700) >> 8;
  RT = (IR & 0x000000E0) >> 5;
  RDR = (IR & 0x0000001C) >> 2;
  RDI = RT;
  IMM8 = IR & 0x000000FF;
  IMM5 = IR & 0x0000001F;
  DISP = IR & 0x000007FF;
  EXTOP = IR & 0x00000003;
  
  return opcode;
}

#include "ops.c"

void Execute(int opcode)
{
  switch(opcode) {
  case 0x00: //halt
    EXIT=TRUE;
    if(SHOWINST) printf("halt\n");
    printf("program halted\n");
    break;
  case 0x01: //nop
    nop();
    break;
  case 0x02: //exception
    ex();
    break;
  case 0x03: //rti
    rti();
    break;
  case 0x08: //addi
    addi();
    break;
  case 0x09: //subi
    subi();
    break;
  case 0x0A: //xori
    xori();
    break;
  case 0x0B: //andni
    andni();
    break;
  case 0x14: //roli
    roli();
    break;
  case 0x15: //slli
    slli();
    break;
  case 0x16: //rori
    rori();
    break;
  case 0x17: //srli
    srli();
    break;
  case 0x10: //st
    st();
    break;
  case 0x11: //ld
    ld();
    break;
  case 0x13: //stu
    stu();
    break;
  case 0x19: //btr
    btr();
    break;
  case 0x1B:
    switch(EXTOP){
    case 0x0: //add
      add();
      break;
    case 0x1: //sub
      sub();
      break;
    case 0x2: //xor
      xor();
      break;
    case 0x3: //andn
      andn();
      break;
    }
    break;
  case 0x1A:
    switch(EXTOP){
    case 0x0:
      rol();
      break;
    case 0x1:
      sll();
      break;
    case 0x2:
      ror();
      break;
    case 0x3:
      srl();
      break;
    }
    break;
  case 0x1C:
    seq();
    break;
  case 0x1D:
    slt();
    break;
  case 0x1E:
    sle();
    break;
  case 0x1F:
    sco();
    break;
  case 0x0C:
    beqz();
    break;
  case 0x0D:
    bnez();
    break;
  case 0x0E:
    bltz();
    break;
  case 0x0F:
    bgez();
    break;
  case 0x18:
    lbi();
    break;
  case 0x12:
    slbi();
    break;
  case 0x04:
    j();
    break;
  case 0x05:
    jr();
    break;
  case 0x06:
    jal();
    break;
  case 0x07:
    jalr();
    break;
  default:
    fprintf(stderr,"Illegal Opcode Found!  0x%x\n",opcode);
    break;
  }
}

unsigned int hex_to_int(char * num)
{

  int i;
  unsigned int val=0;
  int length;
  
  length = strlen(num);
  
  for(i=0;i<length;i++){
    if(num[i]=='\n'){
      num[i] = '\0';
      length = i+1;
      break;
    }
  }

  for(i=0; i< length; i++)
    {
      if(num[i]>='0'&&num[i]<='9')
	val += ((int) num[i] - 48) * pow(16,length-(i));
      else if(num[i]>='a' && num[i] <='f')
	val += ((int) num[i] - 87) * pow(16,length-(i));
      else if(num[i]>='A' && num[i] <='F')
	val += ((int) num[i] - 55) * pow(16,length-(i));
      else {
	fprintf(stderr,"%s is not a valid hexadecimal number!\n",num);
	return -1;
      }
    }
  return val>>4;
}

void invalidateDMEM()
{
  int i;
  for(i = 0; i< MEM_SIZE; i++){
    DMEM_VALID[i] = 0;
  }
}

int main(int argc, char* argv[])
{
  char* command;
  int nCommandBytes = 100;
  int commandLength;
  int i, step;
  char* param;
  char* mem_dump_filename;
  char* reg_dump_filename;
  FILE* fp;

  BREAKSIZE = 0;
  EXIT = FALSE;
  
  clearRegFile();
  invalidateDMEM();

  printf("\nWISCalculator v1.0\nAuthor Derek Hower (drh5@cs.wisc.edu)\nType \"help\" for more information\n\n");
  FILE *trace_file;
  FILE *ptrace_file;
  
  

  if ( (argc == 2) || 
       ( (argc == 3) && ( (strcmp(argv[1], "-noalign") == 0) ||  (strcmp(argv[1], "-align") == 0) ) ) ) {
    char *filename;
    check_alignment = 0;
    if (argc == 3) {
      filename = argv[2];
      if  (strcmp(argv[1], "-align") == 0) check_alignment = 1;
    } else {
      filename = argv[1];
    }
    trace_file = fopen("archsim.trace", "w");
    ptrace_file = fopen("archsim.ptrace", "w");
    mem_dump_filename = (char*) malloc(strlen(filename)+5);
    reg_dump_filename = (char*) malloc(strlen(filename)+4);

    strcpy(mem_dump_filename, filename);
    strcpy(reg_dump_filename, filename);

    clearRegFile();
    ReadHexFile(filename);
    printf("Executing...\n");
    SHOWINST = TRUE;
    int n_inst = 0;
    while(!EXIT) {
      dest_reg = -2;
      int old_PC = REG[PC];
      Fetch(); if (EXIT) break;
      int opcode = Decode(); if (EXIT) break;
      Execute(Decode()); if (EXIT) break;
      if (dest_reg == -2) {
        if (opcode == 0x00) {
          fprintf(trace_file, "INUM: %8d PC: 0x%04x\n", n_inst, old_PC);
          printf("INUM: %8d PC: 0x%04x\n", n_inst, old_PC);
        } else if ( opcode == 0x01) {
          fprintf(trace_file, "INUM: %8d PC: 0x%04x\n", n_inst, old_PC);
          printf("INUM: %8d PC: 0x%04x\n", n_inst, old_PC);
        } else {
          printf("Error in simulator, dest_reg did not change %d\n", opcode);
          exit(-1);
        }
      } else if (dest_reg == -1) {
        if (opcode == 0x10) {
          // st
          fprintf(trace_file, "INUM: %8d PC: 0x%04x ADDR: 0x%04x VALUE: 0x%04x\n", n_inst, old_PC, dest_addr, dest_val);
          fprintf(ptrace_file, "STORE: ADDR: 0x%04x VALUE: 0x%04x\n", 
                  dest_addr, dest_val);
          printf("INUM: %8d PC: 0x%04x ADDR: 0x%04x VALUE: 0x%04x\n", n_inst, old_PC, dest_addr, dest_val);
        } else if (opcode == 0x02) {
          // ex
          //          fprintf(trace_file, "INUM: %8d PC: 0x%04x EPC: 0x%04x\n", n_inst, old_PC, REG[EPC]);
          //          printf("INUM: %8d PC: 0x%04x EPC: 0x%04x\n", n_inst, old_PC, REG[EPC]);
          fprintf(trace_file, "INUM: %8d PC: 0x%04x\n", n_inst, old_PC);
          printf("INUM: %8d PC: 0x%04x\n", n_inst, old_PC);
        } else {
          // branch
          fprintf(trace_file, "INUM: %8d PC: 0x%04x\n", n_inst, old_PC);
          printf("INUM: %8d PC: 0x%04x\n", n_inst, old_PC);
        }
      } else {
        if (opcode == 0x13) {
          // stu
          fprintf(trace_file, "INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x ADDR: 0x%04x VALUE: 0x%04x\n", n_inst, old_PC, 
                  dest_reg, dest_val,
                  dest_addr, dest_mem_val);
          fprintf(ptrace_file, "STORE: ADDR: 0x%04x VALUE: 0x%04x\n", 
                  dest_addr, dest_mem_val);
          fprintf(ptrace_file, "REG: %d VALUE: 0x%04x\n", 
                  dest_reg, dest_val);

          printf("INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x ADDR: 0x%04x VALUE: 0x%04x\n", n_inst, old_PC, 
                 dest_reg, dest_val,
                 dest_addr, dest_mem_val);

        } else if (opcode == 0x11) {
          // ld
          fprintf(trace_file, "INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x ADDR: 0x%04x\n", n_inst, old_PC, dest_reg, dest_val, dest_addr);
          fprintf(ptrace_file, "LOAD: ADDR: 0x%04x VALUE: 0x%04x\n", 
                  dest_addr, dest_val);
          fprintf(ptrace_file, "REG: %d VALUE: 0x%04x\n", 
                  dest_reg, dest_val);

          printf("INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x ADDR: 0x%04x\n", n_inst, old_PC, dest_reg, dest_val, dest_addr);
        } else {
          // other 
          fprintf(trace_file, "INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x\n", n_inst, old_PC, dest_reg, dest_val);
          fprintf(ptrace_file, "REG: %d VALUE: 0x%04x\n", dest_reg, dest_val);
          printf("INUM: %8d PC: 0x%04x REG: %d VALUE: 0x%04x\n", n_inst, old_PC, dest_reg, dest_val);
        }
      }
      n_inst++;
      if (n_inst > 100000) {
        fprintf(stderr, "Too many instructions...something is wrong perhaps?\n");
        break;
      }
    }
    fclose(trace_file);
    fclose(ptrace_file);
    EXIT=FALSE;
    SHOWINST=FALSE;
    fp = fopen(strcat(mem_dump_filename,".dmem"),"w");
    DumpDMemory(fp);
    close(fp);
    fp = fopen(strcat(reg_dump_filename,".reg"),"w");
    regDumpFile(fp);
    close(fp);
    printf("Program Finished\n");
  }
  else {
    do
      {
	command = GetCommand(command);
	switch(parseCommand(command, &param)) {
	case 0: // load
	  clearRegFile();
	  ReadHexFile(param);

	  mem_dump_filename = (char*) malloc(strlen(param)+5);
	  reg_dump_filename = (char*) malloc(strlen(param)+4);
	  
	  strcpy(mem_dump_filename, param);
	  strcpy(reg_dump_filename, param);

	  //MAIN_RETURN = reg[31];
	  break;
	case 1: //run
	  REG[PC] = 0;
	  if(strncmp(param, "-p",2)==0){
	    SHOWINST = TRUE;
	  }
	  while(!EXIT) {
	    Fetch();
	    Execute(Decode());
	    if(isBreak(REG[PC])){
	      printf("Breakpoint encountered at 0x%x\n",REG[PC]);
	      break;
	    }
	  }
	  EXIT=FALSE;
	  break;
	case 2: //dump
	  fp = fopen(strcat(mem_dump_filename,".dmem"),"w");
	  DumpDMemory(fp);
	  close(fp);
	  break;
	case 3: //step
	  step = atoi(param);
	  SHOWINST = TRUE;
	  for(i=0;i<step && !EXIT;i++)
	    {
	      Fetch();
	      Execute(Decode());
	      if(isBreak(REG[PC])){
		printf("Breakpoint encountered at 0x%x\n",REG[PC]);
		break;
	      }
	    }
	  SHOWINST = FALSE;
	  break;
	case 4: //help
	  printHelp();
	  break;
	case 5: //print
	  if(strcmp(param, "all")==0){
	    regDump();
	  }
	  else if(atoi(param)<0 || atoi(param)>7){
	    fprintf(stderr,"Illegal register  reference!\n");
	    break;
	  }
	  else {
	    printf("R%i 0x%x\n",atoi(param), REG[atoi(param)]);
	  }
	  break;
	case 6: //break
	  BREAK[BREAKSIZE] = hex_to_int(param);
	  BREAKSIZE++;
	  break;
	case 7: //read
	  printf("DMEM Address 0x%s = %x\n",
		 param,ReadDMemory(hex_to_int(param)));
	  break;
	case 8: //continue
	  while(!EXIT) {
	    Fetch();
	    Execute(Decode());
	    if(isBreak(REG[PC])){
	      printf("Breakpoint encountered at 0x%x\n",REG[PC]);
	      break;
	    }
	  }
	  EXIT=FALSE;
	  break;
	case -1:
	  break;
	}
      }     while(strncmp(command,"exit",4));
  }
  return 0;
}

