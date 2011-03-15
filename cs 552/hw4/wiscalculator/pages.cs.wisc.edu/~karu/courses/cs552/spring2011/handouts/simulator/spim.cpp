/* 
 * Shell of Spimilator/04
 *
 * Reads input hex file, provides memory management utility functions,
 * dummies fetch/decode cycles.
 *
 * John Board 03/22/04
 * 
 * Revised 04/21/04 by Derek Hower
 */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <iostream>
#include <exception>
#include <math.h>


#define TRUE 1
#define FALSE 0

/* 
 * Memory and register variables should properly be delcared as globals in a
 * C environment, since any modification to a simulated register or memory value has,
 * by definition, "global" consequences
 */

/*  
 * Memory declarations 
 */

//#define TEXT_MEM_SIZE	2048	/* bytes, must be multiple of 4  */
#define TEXT_MEM_SIZE	131072	/* bytes, must be multiple of 4  */
#define DATA_MEM_SIZE	131072	/* bytes, must be multiple of 4  */
#define STACK_MEM_SIZE	2048	/* bytes, must be multiple of 4  */

#define TEXT_START	(unsigned) 0x00400000
#define DATA_START	(unsigned) 0x10000000
#define STACK_START	(unsigned) (0x7fffffff - STACK_MEM_SIZE + 1)

unsigned int TextMem[TEXT_MEM_SIZE/4];	/* Memory is word organized, */
unsigned int DataMem[DATA_MEM_SIZE/4];	/* thus divide by 4 */
unsigned int StackMem[STACK_MEM_SIZE/4];

/* 
 * Reserved register declarations
 */

unsigned int PC = TEXT_START;
unsigned int MAR, MBR, IR;
unsigned int HI, LO, STATUS, CAUSE, BADVADDR, EPC;
unsigned int RS, RT, RD, IMM, SHAMT;

/*
 * 32 general purpose registers
 * stored in an array and accessed by defnitions
 */

unsigned int reg[32];

#define AT 1
#define V0 2
#define V1 3
#define A0 4
#define A1 5
#define A2 6
#define A3 7
#define T0 8
#define T1 9
#define T2 10
#define T3 11
#define T4 12
#define T5 13
#define T6 14
#define T7 15
#define S0 16
#define S1 17
#define S2 18
#define S3 19
#define S4 20
#define S5 21
#define S6 22
#define S7 23
#define T8 24
#define S9 25
#define K0 26
#define K1 27
#define GP 28
#define SP 29
#define FP 30
#define RA 31

const unsigned int ZERO =  0;

/*
 * Local Function Declarations
 */

int GetLine(FILE *fp, char *Buffer);
int LittleEndian();
void Fetch();
int Decode();
void Execute(int);
int signExtend();
void formatReg(int);

void FunctionSelect();
void BrachSelect();
void j();
void jal();
void beq();
void bne();
void blez();
void bgtz();
void addi();
void addiu();
void slti();
void sltiu();
void andi();
void ori();
void xori();
void lui();
void lb();
void lh();
void lwl();
void lw();
void lbu();
void lhu();
void lwr();
void sb();
void sh();
void swl();
void sw();
void swr();
void sll();
void srl();
void sra();
void sllv();
void srlv();
void srav();
void jr();
void jalr();
void syscall();
void breakI();
void mfhi();
void mthi();
void mflo();
void mtlo();
void mult();
void multu();
void div();
void divu();
void add();
void addu();
void sub();
void subu();
void and();
void or();
void xor();
void nor();
void slt();
void sltu();
void bltz();
void bgez();
void bltzal();
void bgezal();


/* 
 * Setting DEBUG = TRUE causes diagnostic output to be printed.
 * You will want to set DEBUG = FALSE once you understand what's going on here;
 * this is a nice trick for your own code as well
 */

int DEBUG = FA;

/*
 * SHOWINST used to determine if instructions should be displayed as they are exectued.
 * The option -p will force SHOWINST = TRUE.  Stepping also forces TRUE.  
 * On normal operation, SHOWINST defaults to FALSE
 */

int SHOWINST = FALSE;

/*
 * MAIN_RETURN is set to the initial value of $r31.  When any jump statement
 * encounters this address, EXIT will be set to true and the program
 * will terminate.
 */

unsigned int MAIN_RETURN;
bool EXIT;

/*
 * BREAK stores the breakpoints as defined by the user.  
 * BREAKSIZE keeps track of the number of breaks currently active
 */

unsigned int BREAK[100];
int BREAKSIZE;

/* define function ReadMemory(Address) for interpreting memory addresses into
 * correct memory array so user can simply reference virtual addresses
 * in statements like MBR = ReadMemory(MAR); this hides details of the three
 * arrays above from the rest of the program.
 */

unsigned int ReadMemory(unsigned int Address) {
	/* first check for word alignment */
	if((Address % 4) != 0) {
		cerr << "\nERROR: Unaligned Address Exception : occured at PC = 0x";
		formatReg(PC);
		cerr << endl << "Occured and Ignored\n\n";
		EPC = PC;
		CAUSE = 4;
		return 0;
	}
	/* is this a valid text (code) reference? */
	if((Address >= TEXT_START) && (Address < (TEXT_START + TEXT_MEM_SIZE - 1)))
		return(TextMem[(Address - TEXT_START) / 4]);
	/* is this a valid data reference? */
	if((Address >= DATA_START) && (Address < (DATA_START + DATA_MEM_SIZE - 1)))
		return(DataMem[(Address - DATA_START) / 4]);
	/* is this a valid stack reference? */
	if((Address >= STACK_START) && (Address < (STACK_START + STACK_MEM_SIZE - 1)))
		return(StackMem[(Address - STACK_START) / 4]);
	/* uh oh - getting here means we have an illegal address */
	cerr << "\nERROR: Read exception : occured at PC = 0x";
	formatReg(PC);
	cerr << endl << "Occured and Ignored\n\n";
	EPC = PC;
	CAUSE = 4;
}

/* 
 * We also need a routine to write memory values, similar to above, but the
 * "Value" operand needs to be copied to the appropriate address
 */

void WriteMemory(unsigned int Address, int Value) {
        /* is this a valid text (code) reference? */
        if((Address >= TEXT_START) && (Address < (TEXT_START + TEXT_MEM_SIZE - 1)))
                {TextMem[(Address - TEXT_START) / 4] = Value; return;}
        /* is this a valid data reference? */
        if((Address >= DATA_START) && (Address < (DATA_START + DATA_MEM_SIZE - 1)))
                {DataMem[(Address - DATA_START) / 4] = Value; return;}
        /* is this a valid stack reference? */
        if((Address >= STACK_START) && (Address < (STACK_START + STACK_MEM_SIZE - 1)))
                {StackMem[(Address - STACK_START) / 4] = Value; return;}
        /* uh oh - getting here means we have an illegal address */
        cerr << "\nERROR: Write exception : occured at PC = 0x";
		formatReg(PC);
		cerr << endl << "Occured and Ignored\n\n";
		EPC = PC;
		CAUSE = 4;
}

/*
 * Function ReadHexFile processes the file hex.out, placing the code in the
 * code array, and the data in the data array, prior to executing the program.
 */

void ReadHexFile(char * filename){
	FILE *fp;			/* File descriptor for hex.out */
	int Value;
	char LineBuffer[132];			/* Buffer for each line in turn */
	int MemoryCounter = TEXT_START ;	/* Prepare to load starting at */
	int LineNumber = 1;			/*   first code segment location */
	int CODE = TRUE;			/* Differentiate CODE/DATA */

	/* try to open hex.out read-only */
	if((fp=fopen(filename,"r")) == NULL) {
		cerr << "ERROR: failed to open " << filename << "!\n";
		return;
	}
	/* begin reading lines from hex.out into code segment, looking for
	 * DATA SEGMENT flag
	 */
	cout << "Loading text segment...\n";
	while(GetLine(fp,LineBuffer)!= EOF) {
		if(DEBUG) cout << "Processing line "<< LineNumber++ << ", ";
		if(DEBUG) cout << "Input line is " << LineBuffer << endl;
		if(CODE) {
			if(LineBuffer[0] == 'D') {	/* found Data Segment */
				cout << "Loading Data Segment...\n";
				CODE = FALSE;
			} else {			/* this must be code */
				sscanf(LineBuffer,"%x",&Value);
				WriteMemory(MemoryCounter,Value);
				MemoryCounter += 4;
			}
		} else { /* DATA */
			sscanf(LineBuffer,"%x %x",&MemoryCounter, &Value);
			WriteMemory(MemoryCounter, Value);
		}
	}
	
}

int GetLine(FILE *fp, char *Buffer) {
	while ((*Buffer = getc(fp)) != EOF) {
		if(*Buffer++ == '\n') 
			{*(--Buffer) = '\0'; return(1);}
	}
	return(EOF);
	
}

/*
 * Returns a string representation of the general purpose registers
 */
char * registerName(int num)
{
	switch(num)
	{
		case 0:
			return "$0 ";
		case 1:
			return "$at";
		case 2:
			return "$v0";
		case 3:
			return "$v1";
		case 4:
			return "$a0";
		case 5:
			return "$a1";
		case 6:
			return "$a2";
		case 7:
			return "$a3";
		case 8:
			return "$t0";
		case 9:
			return "$t1";
		case 10:
			return "$t2";
		case 11:
			return "$t3";
		case 12:
			return "$t4";
		case 13:
			return "$t5";
		case 14:
			return "$t6";
		case 15:
			return "$t7";
		case 16:
			return "$s0";
		case 17:
			return "$s1";
		case 18:
			return "$s2";
		case 19:
			return "$s3";
		case 20:
			return "$s4";
		case 21:
			return "$s5";
		case 22:
			return "$s6";
		case 23:
			return "$s7";
		case 24:
			return "$t8";
		case 25:
			return "$s9";
		case 26:
			return "$k0";
		case 27:
			return "$k1";
		case 28:
			return "$gp";
		case 29:
			return "$sp";
		case 30:
			return "$fp";
		case 31:
			return "$ra";
	}
}

/*
 * Outputs the contents of a given register in hex
 */
void formatReg(int index)
{
	for(int i=2*sizeof(int) - 1; i>=0; i--)
		cout << "0123456789ABCDEF"[((index>>i*4) & 0xF)];

}

/*
 * Formats and prints a register dump
 */
void regDump()
{
	//print globals
	cout << "\nPC\t0x";
	formatReg(PC);
	cout << "\tEPC\t0x";
	formatReg(EPC);
	cout << "\tCause\t0x";
	formatReg(CAUSE);
	cout << "\tBadVaddr 0x";
	formatReg(BADVADDR);
	cout << "\nSTATUS\t0x";
	formatReg(STATUS);
	cout << "\tHI\t0x";
	formatReg(HI);
	cout << "\tLO\t0x";
	formatReg(LO);
	cout << "\n\n";

	//print general regs
	for(int i = 0; i<32; i++)
	{
		if(i%4==0)
		{
			
			cout << "\nR";
			cout.fill('0');
			cout.width(2);
			cout << i;
			cout << "(" << registerName(i)  << ") 0x";
			formatReg(reg[i]);
		}
		else
		{
			cout << "\tR"; 
			cout.fill('0');
			cout.width(2);
			cout << i;
			cout << "("  <<registerName(i)  << ") 0x";
			formatReg(reg[i]);
		}
	}
	cout << "\n\n";
}

/*
 * Called when user types "help" at SPIM prompt.  
 */
void printHelp()
{
	cout << "\nSPIMulator 1.0 help\nread <filname> -- reads in assmebled binary file \"filename\" for execution\nrun {-p}       -- runs program until breakpoint.\n\tOption -p will print each instruction as it is executed.\nstep <n>       -- steps n instructions\nbreak <address> -- inserts a breakpoint at specified memory address\nprint <register> -- prints the contenets of the register located at either the \n\tnumerical or common name (e.g. 3 or v0 will both print register R3)\ndump           -- prints contents of all registers\n\n";
}


bool isBreak(unsigned int address)
{
	for(int i=0; i<BREAKSIZE; i++){
		if(address == BREAK[i]){
			BREAK[i]=0;
			return true;}}
	return false;
}


/*
 * Resets all registers to 0, and PC to the start of the text statement. Function is called
 * before a read from file so that the program can be reset.
 */
void clearRegFile()
{
	PC = TEXT_START;
	MAR = MBR = IR = HI = LO = STATUS = CAUSE = BADVADDR = EPC = 0;

	for(int i=0;i<32;i++)
		reg[i]=0;
	//initialization
	reg[29] = STACK_START + STACK_MEM_SIZE - 1;
}

/*
 * Parses the SPIM command prompt and returns a value for proper execution
 */
int parseCommand(char * input, char * argv[2])
{
	char command[10];
	int i, argc = 0, j=0;
	argv[1]="";
	for(i=0;input[i]!='\0';i++,j++)
	{
		if(input[i]==' ')
		{
			command[j]='\0';
			argv[argc] = new char [10];
			strcpy(argv[argc],command);
			argc++;
			j=-1;
			continue;
		}
		command[j]=input[i];
	}
	command[j]='\0';
	argv[argc] = new char [10];
	strcpy(argv[argc],command);
	if(strcmp(argv[0],"read")==0)
	{
		if(strcmp(argv[1],"")==0)
			argv[1]="hex.out";
		return 0;
	}
	if(strcmp(argv[0],"run")==0)
		return 1;
	if(strcmp(argv[0],"dump")==0)
		return 2;
	if(strcmp(argv[0],"step")==0)
	{
		if(strcmp(argv[1],"")==0)
			argv[1]="1";
		return 3;
	}
	if(strcmp(argv[0],"help")==0)
		return 4;
	if(strcmp(argv[0],"print")==0)
		return 5;
	if(strcmp(argv[0],"break")==0)
		return 6;
	else
		return -1;
}

unsigned int hex_to_int(char * num)
{
	unsigned int val=0;
	for(int i=2; i< 10; i++)
	{
		if(num[i]>'0'&&num[i]<='9')
			val += ((int) num[i] - 48) * pow(16,9-i);
		if(num[i]>='a' && num[i] <='f')
			val += ((int) num[i] - 87) * pow(16,9-i);
		if(num[i]>='A' && num[i] <='F')
			val += ((int) num[i] - 55) * pow(16,9-i);
	}
	return val;
}

void main(int argc, char *argv[]) {

	char command[100];
	int i, step;
	char * parseArg[2];
	BREAKSIZE = 0;

	clearRegFile();

	cout << "SPIMulator v1.0\nAuthor Derek Hower (drh5@duke.edu)\nType \"help\" for more information\n\n";

	while(strcmp(command,"exit"))
	{
		cout << "SPIM%";
		cin.getline(command,256);
		switch(parseCommand(command, parseArg))
		{
			case 0:  //read
				/* read in the executable file */
				clearRegFile();
				ReadHexFile(parseArg[1]);
				MAIN_RETURN = reg[31];
				break;
			case 1:  //run
				/* Main loop: initiate the instruction cycle forever */
				if(strcmp(parseArg[1], "-p")==0)
					SHOWINST = TRUE;
				while(!EXIT) {
					if(isBreak(PC)){
						cout << "Breakpoint encountered at 0x";
						formatReg(PC);
						cout << "!\n" ;
						break;}
					
					Fetch();
					Execute(Decode());
				}
				EXIT=FALSE;
				SHOWINST=FALSE;
				break;
			case 2:  //dump
				regDump();
				break;
			case 3:  //step
				step = atoi(parseArg[1]);
				SHOWINST = TRUE;
				for(i=0;i<step && !EXIT;i++)
				{
					if(isBreak(PC)){
						cout << "Breakpoint encountered at 0x";
						formatReg(PC);
						cout << "!\n" ;
						break;}
					reg[0] = ZERO;
					Fetch();
					Execute(Decode());
				}
				SHOWINST = FALSE;
				break;
			case 4:  //help
				printHelp();
				break;
			case 5:  //print
				if(atoi(parseArg[1])<0 || atoi(parseArg[1])>31){
					cerr << "Illegal register  reference!\n";
					break;}
				cout << "R" << atoi(parseArg[1]) << " " << registerName(atoi(parseArg[1])) << " 0x";
				formatReg(reg[atoi(parseArg[1])]);
				cout << endl;
				break;
			case 6:  //break
				BREAK[BREAKSIZE] = hex_to_int(parseArg[1]);
				BREAKSIZE++;
				break;
			case -1:
				break;

		}
	}

}


void Fetch(){
	MAR = PC;
	MBR = ReadMemory(MAR);
	IR = MBR;
	if(DEBUG){ cout << "Address 0x "; formatReg(PC); cout << ": Instruction 0x"; formatReg(IR);  cout << endl;}
	PC = PC + 4;
}
		
int Decode()
{
	unsigned int opMask = IR & 0xfc000000;
	opMask >>= 26;

	RS = (IR & 0x03e00000) >> 21;
	RT = (IR & 0x001f0000) >> 16;
	RD = (IR & 0x0000f800) >> 11;
	IMM = IR & 0x0000ffff;
	SHAMT = (IR & 0x000007c0) >> 6;

	return opMask;
}

void Execute(int opMask)
{
	try
	{
		switch(opMask)
		{
			case 0:
				FunctionSelect();
				break;
			case 1:
				BrachSelect();
				break;
			case 2:
				j();
				break;
			case 3:
				jal();
				break;
			case 4:
				beq();
				break;
			case 5:
				bne();
				break;
			case 6:
				blez();
				break;
			case 7:
				bgtz();
				break;
			case 8:
				addi();
				break;
			case 9:
				addiu();
				break;
			case 10:
				slti();
				break;
			case 11:
				sltiu();
				break;
			case 12:
				andi();
				break;
			case 13:
				ori();
				break;
			case 14:
				xori();
				break;
			case 15:
				lui();
				break;
			case 32:
				lb();
				break;
			case 33:
				lh();
				break;
			case 34:
				lwl();
				break;
			case 35:
				lw();
				break;
			case 36:
				lbu();
				break;
			case 37:
				lhu();
				break;
			case 38:
				lwr();
				break;
			case 40:
				sb();
				break;
			case 41:
				sh();
				break;
			case 42:
				swl();
				break;
			case 43:
				sw();
				break;
			case 46:
				swr();
				break;
			default:
				throw opMask;
		}
	}
	catch(int i)
	{
		cerr << "ERROR: Illegal Instruction Exception : Opcode " << i << endl;
		EPC = PC;
		CAUSE = 10;
		PC = 0x80000080;  //run interrupt handler
	}
}

void FunctionSelect()
{
	int funcMask = IR & 0x0000003f;
	try{
		switch(funcMask)
		{
			case 0:
				sll();
				break;
			case 2:
				srl();
				break;
			case 3:
				sra();
				break;
			case 4:
				sllv();
				break;
			case 6:
				srlv();
				break;
			case 7:
				srav();
				break;
			case 8:
				jr();
				break;
			case 9:
				jalr();
				break;
			case 12:
				syscall();
				break;
			case 13:
				breakI();
				break;
			case 16:
				mfhi();
				break;
			case 17:
				mthi();
				break;
			case 18:
				mflo();
				break;
			case 19:
				mtlo();
				break;
			case 24:
				mult();
				break;
			case 25:
				multu();
				break;
			case 26:
				div();
				break;
			case 27:
				divu();
				break;
			case 32:
				add();
				break;
			case 33:
				addu();
				break;
			case 34:
				sub();
				break;
			case 35:
				subu();
				break;
			case 36:
				and();
				break;
			case 37:
				or();
				break;
			case 38:
				xor();
				break;
			case 39:
				nor();
				break;
			case 42:
				slt();
				break;
			case 43:
				sltu();
				break;
			default:
				throw funcMask;
		}
	}
	catch (int i) {
		cerr << "ERROR: Illegal function select! Func = " << i << endl;
		EPC = PC;
		CAUSE = 10;
	}
}
void BrachSelect()
{
	try{
		switch(RT)
		{
			case 0:
				bltz();
				break;
			case 1:
				bgez();
				break;
			case 16:
				bltzal();
				break;
			case 17:
				bgezal();
				break;
			default:
				throw RT;
		}
	}
	catch (int i){
		cerr << "ERROR: Illegal branch select! Branch = " << i << endl;
		EPC = PC;
		CAUSE = 10;
	}
}
void j()
{
	if(SHOWINST) cout << "j " << (IR & 0x03ffffff) << endl;
	unsigned int target = IR & 0x03ffffff;
	if(target == MAIN_RETURN)
		EXIT = true;
	else
		PC = target*4;
}
void jal()
{
	if(SHOWINST) cout << "jal " << (IR & 0x03ffffff) << endl;
	unsigned int target = IR & 0x03ffffff;
	reg[RA] = PC;
	if(target == MAIN_RETURN)
		EXIT = true;
	else
		PC = target*4;
}
void beq()
{
	if(SHOWINST) cout << "beq " << registerName(RS) << " " << registerName(RT) << " " << signExtend() << endl;
	if(reg[RS] == reg[RT])
	{
		PC = PC + (signExtend()-1)*4;
	}
}
void bne()
{
	if(SHOWINST) cout << "bne " << registerName(RS) << " " << registerName(RT) << " " << signExtend() << endl;
	if( reg[RS] != reg[RT] )
		PC = PC + (signExtend()-1)*4;
}
void blez()
{
	if(SHOWINST) cout << "blez " << registerName(RS) << " " << registerName(RT) << " " << signExtend() << endl;
	if( (int) reg[RS] <=0 )
		PC = PC + (signExtend()-1)*4;
}
void bgtz()
{
	if(SHOWINST) cout << "bgtz " << registerName(RS) << " " << registerName(RT) << " " << signExtend() << endl;
	if( (int) reg[RS] > 0 )
		PC = PC + (signExtend()-1)*4;
}
void addi()
{
	if(SHOWINST) cout << "addi " << registerName(RT) << " " << registerName(RS) << " " << signExtend() << '\n';
	try{
		reg[RT]= (int) reg[RS] + signExtend();
		if(((int) reg[RS] > 0) && (signExtend() > 0) && ((int) reg[RT] <=0))
			throw ("Overflow!");
		if(((int) reg[RS] < 0) && (signExtend() < 0) && ((int) reg[RT] >=0))
			throw ("Underflow!");
	}
	catch(char * what)
	{
		cerr << "\nERROR: Arithmatic Exception : " << what << " occured at PC = 0x";
		formatReg(PC);
		cerr << endl << "Occured and Ignored\n\n";
		EPC = PC;
	}
}
void addiu()
{
	if(SHOWINST) cout << "addiu " << registerName(RT) << " " << registerName(RS) << " " << signExtend() << '\n';
	reg[RT]= reg[RS] + signExtend();
}
void slti()
{
	if(SHOWINST) cout << "slti "<< registerName(RT) << " " << registerName(RS) << " " << signExtend() << '\n';
	if((int) reg[RS] < signExtend())
		reg[RT] = 1;
	else
		reg[RT] = 0;
}
void sltiu()
{
	if(SHOWINST) cout << "sltiu "<< registerName(RT) << " " << registerName(RS) << " " << signExtend() << '\n';
	if( reg[RS] < signExtend())
		reg[RT] = 1;
	else
		reg[RT] = 0;
}
void andi()
{
	if(SHOWINST) cout << "andi " << registerName(RT) << " " << registerName(RS) << " " << IMM << '\n';
	reg[RT]= reg[RS] & IMM;	
}
void ori()
{
	if(SHOWINST) cout << "ori " << registerName(RT) << " " << registerName(RS) << " " << IMM << '\n';
	reg[RT] = reg[RS] | IMM;
}
void xori()
{
	if(SHOWINST) cout << "xori " << registerName(RT) << " " << registerName(RS) << " " << IMM << '\n';
	reg[RT] = reg[RS] ^ IMM;
}
void lui()
{
	if(SHOWINST) cout << "lui " << registerName(RT) << " " << IMM << endl;
	reg[RT] = (IMM << 16);
}
void lb()
{
	if(SHOWINST) cout << "lb\n";
	int offset = (reg[RS] + signExtend()) % 4;
	int byte = ReadMemory(reg[RS] + signExtend() - offset);
	byte >>= (24 - (8*offset));
	byte = byte & 0x000000ff;
	//negative checking - sign extend if needed
	if (byte & 0x00000080)
		byte |= 0xffffff00;
	reg[RT] = byte;
}
void lh()
{
	if(SHOWINST) cout << "lh\n";
	int offset = (reg[RS] + signExtend()) % 4;
	int halfword = ReadMemory(reg[RS] + signExtend() - offset);
	halfword >>= (16 - (8*offset));
	halfword = halfword & 0x0000ffff;
	if (halfword & 0x00008000)
		halfword |= 0xffff0000;
	reg[RT] = halfword;

}
void lwl()
{
	if(SHOWINST) cout << "lwl\n";
	int offset = (reg[RS] + signExtend()) % 4;
	int left = ReadMemory(reg[RS] + signExtend() - offset);
	left <<= (8*offset);
	//set leftmost bits to zero
	reg[RT] <<= 32 - (8*offset);
	reg[RT] >>= 32 - (8*offset); 

	reg[RT] = reg[RT] | left;

}
void lw()
{
	if(SHOWINST) cout << "lw " << registerName(RT) << " " << signExtend() << "(" << registerName(RS) << ")" << endl;
	reg[RT] = ReadMemory(reg[RS] + signExtend());
}
void lbu()
{
	if(SHOWINST) cout << "lbu\n";
	int offset = (reg[RS] + signExtend()) % 4;
	int byte = ReadMemory(reg[RS] + signExtend() - offset);
	byte >>= (24 - (8*offset));
	byte = byte & 0x000000ff;
	reg[RT] = byte;
}
void lhu()
{
	if(SHOWINST) cout << "lhu\n";
	int offset = (reg[RS] + signExtend()) % 4;
	int halfword = ReadMemory(reg[RS] + signExtend() - offset);
	halfword >>= (16 - (8*offset));
	halfword = halfword & 0x0000ffff;
	reg[RT] = halfword;
}
void lwr()
{
	if(SHOWINST) cout << "lwr\n";
	int offset = (reg[RS] + signExtend()) % 4;
	unsigned int right = ReadMemory(reg[RS] + signExtend() - offset);
	right >>= 24 - (8*offset);
	//set rightmost bits to zero
	reg[RT] >>= 8 + (8*offset);
	reg[RT] <<=8 + (8*offset);

	reg[RT] = reg[RT] | right;
}
void sb()
{
	if(SHOWINST) cout << "sb\n";
	int offset = (reg[RS] + signExtend()) % 4;
	unsigned int oldWord = ReadMemory(reg[RS] + signExtend()-offset);
	unsigned int lowByteMask = 0x000000ff;
	unsigned int byte = reg[RT] & lowByteMask;
	unsigned int mask;
	switch(offset)
	{
		case 0:
			mask = 0x00ffffff;
			byte <<= 24;
			break;
		case 1:
			mask = 0xff00ffff;
			byte <<= 16;
			break;
		case 2:
			mask = 0xffff00ff;
			byte <<= 8;
			break;
		case 3:
			mask = 0xffffff00;
			break;
	}
	oldWord = oldWord & mask;
	WriteMemory(reg[RS] + signExtend(), oldWord | byte);
}
void sh()
{
	if(SHOWINST) cout << "sh\n";
	int offset = (reg[RS] + signExtend()) % 4;
	unsigned int oldWord = ReadMemory(reg[RS] + signExtend()-offset);
	unsigned int lowHWMask = 0x0000ffff;
	unsigned int halfword = reg[RT] & lowHWMask;
	unsigned int mask;
	switch(offset)
	{
		case 0:
			mask = 0x0000ffff;
			halfword <<= 16;
			break;
		case 2:
			mask = 0xffff0000;
			break;
	}
	oldWord = oldWord & mask;
	WriteMemory(reg[RS] + signExtend(), oldWord | halfword);
}
void swl()
{
	if(SHOWINST) cout << "swl\n";
	int offset = (reg[RS] + signExtend()) % 4;
	unsigned int regWord = ReadMemory(reg[RS] + signExtend()-offset);
	unsigned int oldWord = reg[RT];
	unsigned int mask;
	switch(offset)
	{
		case 3:
			oldWord &= 0xff000000;
			oldWord >>= 24;
			regWord &= 0xffffff00;
			break;
		case 2:
			oldWord &= 0xffff0000;
			oldWord >>= 16;
			regWord &= 0xffff0000;
			break;
		case 1:
			oldWord &= 0xffffff00;
			oldWord >>= 8;
			regWord &= 0xff000000;
			break;
		case 0:
			mask = 0xffffffff;
			regWord = 0;
			break;
	}
	WriteMemory(reg[RS] + signExtend(), oldWord | regWord);
}
void sw()
{
	if(SHOWINST) cout << "sw " << registerName(RT) << " " << signExtend() << "(" << registerName(RS) << ")" << endl;
	WriteMemory(reg[RS] + signExtend(), reg[RT]);
}
void swr()
{
	if(SHOWINST) cout << "swr\n";
	int offset = (reg[RS] + signExtend()) % 4;
	unsigned int regWord = ReadMemory(reg[RS] + signExtend()-offset);
	unsigned int oldWord = reg[RT];
	unsigned int mask;
	switch(offset)
	{
		case 0:
			oldWord &= 0x000000ff;
			oldWord <<= 24;
			regWord &= 0x00ffffff;
			break;
		case 1:
			oldWord &= 0x0000ffff;
			oldWord <<= 16;
			regWord &= 0x0000ffff;
			break;
		case 2:
			oldWord &= 0x00ffffff;
			oldWord <<= 8;
			regWord &= 0x000000ff;
			break;
		case 3:
			mask = 0xffffffff;
			regWord = 0;
			break;
	}
	WriteMemory(reg[RS] + signExtend(), oldWord | regWord);
}


void sll()
{
	if(SHOWINST) cout << "sll " << registerName(RD) << " " << registerName(RT) << " " << SHAMT << endl;
	int temp = (int) reg[RT];
	reg[RD] = temp << SHAMT;
}
void srl()
{
	if(SHOWINST) cout << "srl " << registerName(RD) << " " << registerName(RT) << " " << SHAMT << endl;
	unsigned int temp = reg[RT];
	reg[RD] = temp >> SHAMT;
}
void sra()
{
	if(SHOWINST) cout << "sra " << registerName(RD) << " " << registerName(RT) << " " << SHAMT << endl;
	int temp = (int) reg[RT];
	reg[RD] = temp >> SHAMT;
}
void sllv()
{
	if(SHOWINST) cout << "sllv " << registerName(RD) << " " << registerName(RT) << " " << registerName(RS) << endl;
	int temp = reg[RT];
	reg[RD] = temp << reg[RS];
}
void srlv()
{
	if(SHOWINST) cout << "srlv " << registerName(RD) << " " << registerName(RT) << " " << registerName(RS) << endl;
	unsigned int temp = reg[RT];
	reg[RD] = temp >> reg[RS];
}
void srav()
{
	if(SHOWINST) cout << "srav " << registerName(RD) << " " << registerName(RT) << " " << registerName(RS) << endl;
	int temp = (int) reg[RT];
	reg[RD] = temp >> reg[RS];
}
void jr()
{
	if(SHOWINST) cout << "jr " << registerName(RS) << endl;
	if(reg[RS] == MAIN_RETURN)
		EXIT = true;
	else
		PC = reg[RS];
}
void jalr()
{
	if(SHOWINST) cout << "jalr " << registerName(RS) << endl;
	reg[RD] = PC;
	if(reg[RS] == MAIN_RETURN)
		EXIT = true;
	else
		PC = reg[RS];
}
void syscall()
{
	if(SHOWINST) cout << "syscall\n";
	bool findNull(unsigned int, char *, int);

	switch(reg[V0])
	{
		case 1:
			cout << reg[A0];
			break;
		case 4:
			char str[100];
			char * temp;
			unsigned int currentWord;
			int count;
			int offset, off2;
			count = 0;
			str[0]='\0';
			offset = reg[A0] % 4;
			off2=offset;
			currentWord = ReadMemory(reg[A0] - offset);
			while( !findNull(currentWord, str, off2) )
			{
				count++;
				currentWord = ReadMemory(reg[A0]+4*count-offset);
				off2 = 0;
			}
			cout << str;
			break;
		case 5:
			int val;
			cin >> val;
			reg[V0] = val;
			break;
		case 11:
			formatReg(reg[A0]);
			break;
		default:
			cout << "Syscall not found!\n";
			exit (1);
	}
}

bool findNull(unsigned int str, char * temp, int offset)
//checks for null as well as concatenates the int str to temp
{
	char a[5];
	int maskOne = 0xff000000;
	int maskTwo = 0x00ff0000;
	int maskThree = 0x0000ff00;
	int maskFour = 0x000000ff;

	for(int i = offset; i < 5; i++)
	{
		if(i ==0)
			a[0 - offset] = ((str & maskOne) >> 24);
		if(i == 1)
			a[1 - offset] = ((str & maskTwo) >> 16);
		if(i == 2)
			a[2 - offset] = ((str & maskThree) >> 8);
		if(i == 3)
			a[3 - offset] = (str & maskFour);
		if(i == 4)
			a[4 - offset] = '\0';
	}

	strcat(temp, a);

	return ( (((maskOne & str) == 0) && (offset != 1)) ||
			 (((maskTwo & str) == 0) && (offset != 2)) ||
			 (((maskThree & str) == 0) && (offset != 3)) ||
			 (((maskFour & str) == 0) && (offset != 4)) );
}

//TODO : break
void breakI()
{
	if(SHOWINST) cout << "break\n";
}
void mfhi()
{
	if(SHOWINST) cout << "mfhi\n";
	reg[RD] = HI;
}
void mthi()
{
	if(SHOWINST) cout << "mthi\n";
	HI = reg[RS];
}
void mflo()
{
	if(SHOWINST) cout << "mflo\n";
	reg[RD] = LO;
}
void mtlo()
{
	if(SHOWINST) cout << "mtlo\n";
	LO = reg[RS];
}

void mult()
{
	if(SHOWINST) cout << "mult " << registerName(RS) << " " << registerName(RT) << endl;
	long long int product;
	product = (long long int) reg[RS] * (long long int) reg[RT];
	LO = (int) (product);
	HI = (int) (product >> 32);
}
void multu()
{
	if(SHOWINST) cout << "multu " << registerName(RS) << " " << registerName(RT) << endl;
	unsigned long long int product;
	product = (unsigned long long int) reg[RS] * (unsigned long long int) reg[RT];
	LO = (unsigned int) (product);
	HI = (unsigned int) ((product) >> 32);
}
void div()
{
	if(SHOWINST) cout << "div " << registerName(RS) << " " << registerName(RT) << endl;
	try{
		if(reg[RT]==0)
			throw ("Division by zero!");
		LO = (int) reg[RS] / (int) reg[RT];
		HI = (int) reg[RS] % (int) reg[RT];
	}
	catch (char * what)
	{
		cerr << "\nERROR: Arithmatic Exception : " << what << " occured at PC = 0x";
		formatReg(PC);
		cerr << endl << "Occured and Ignored\n\n";
		EPC = PC;
	}
}
void divu()
{
	if(SHOWINST) cout << "divu\n";
	try{
		if(reg[RT]==0)
			throw ("Division by zero!");
		LO = reg[RS] / reg[RT];
		HI = reg[RS] % reg[RT];
	}
	catch (char * what)
	{
		cerr << "\nERROR: Arithmatic Exception : " << what << " occured at PC = 0x";
		formatReg(PC);
		cerr << endl << "Occured and Ignored\n\n";
		EPC = PC;
	}
}
void add()
{
	if(SHOWINST) cout << "add " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	if(reg[RS]==0x80000000)
		int i =9;
	try{
		reg[RD]= (int) reg[RS] + (int) reg[RT];
		if((((int) reg[RS] > 0) && ((int) reg[RT] > 0)) && ((int) reg[RD] <= 0))
			throw ("Overflow!");
		if((((int) reg[RS] < 0) && ((int) reg[RT] < 0)) && ((int) reg[RD] >= 0))
			throw ("Underflow!");
	}
	catch(char * what)
	{
		cerr << "\nERROR: Arithmatic Exception : " << what << " occured at PC = 0x";
		formatReg(PC);
		cerr << endl << "Occured and Ignored\n\n";
		EPC = PC;
	}
}
void addu()
{
	if(SHOWINST) cout << "addu " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	reg[RD]= reg[RS] + reg[RT];
}
void sub()
{
	if(SHOWINST) cout << "sub " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	try{
		reg[RD] = (int) reg[RS] - (int) reg[RT];
		if(((int) reg[RS] > 0) && ((int) reg[RT] < 0) && ((int) reg[RD] <= 0))
			throw ("Subtraction Overflow!");
		if(((int) reg[RS] < 0) && ((int) reg[RT] > 0) && ((int) reg[RD] >= 0))
			throw ("Subtraction Underflow!");
	}
	catch (char * what)
	{
		cerr << "\nERROR: Arithmatic Exception : " << what << " occured at PC = 0x";
		formatReg(PC);
		cerr << endl << "Occured and Ignored\n\n";
		EPC = PC;
	}
}
void subu()
{
	if(SHOWINST) cout << "subu " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	reg[RD] = reg[RS] - reg[RT];
}
void and()
{
	if(SHOWINST) cout << "and " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	reg[RD] = reg[RS] & reg[RT];
}
void or()
{
	if(SHOWINST) cout << "or " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	reg[RD] = (reg[RS] | reg[RT]);
}
void xor()
{
	if(SHOWINST) cout << "xor " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	reg[RD] = reg[RS] ^ reg[RT];
}
void nor()
{
	if(SHOWINST) cout << "nor " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	reg[RD] = ~(reg[RS] | reg[RT]);
}
void slt()
{
	if(SHOWINST) cout << "slt " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	if( (int) reg[RS] < (int) reg[RT])
		reg[RD] = 1;
	else
		reg[RD] = 0;
}
void sltu()
{
	if(SHOWINST) cout << "sltu " << registerName(RD) << " " << registerName(RS) << " " << registerName(RT) << endl;
	if( reg[RS] < reg[RT])
		reg[RD] = 1;
	else
		reg[RD] = 0;
}

void bltz()
{
	if(SHOWINST) cout << "bltz " << registerName(RS) << " " << signExtend() << endl;
	if( (int) reg[RS] < 0 )
		PC = PC + (signExtend()-1)*4;
}
void bgez()
{
	if(SHOWINST) cout << "bgez " << registerName(RS) << " " << signExtend() << endl;
	if((int) reg[RS] >= 0 )
		PC = PC + (signExtend()-1)*4;
}
void bltzal()
{
	if(SHOWINST) cout << "bltzal " << registerName(RS) << " " << signExtend() << endl;
	if( (int) reg[RS] < 0 )
	{
		reg[RA] = PC;
		PC = PC + (signExtend()-1)*4;
	}
}
void bgezal()
{
	if(SHOWINST) cout << "bgezal " << registerName(RS) << " " << signExtend() << endl;
	if( (int) reg[RS] >=0 )
	{
		reg[RA] = PC;
		PC = PC + (signExtend()-1)*4;
	}
}

int signExtend()
{
	if(IMM & 0x00008000)
		IMM = IMM | 0xffff0000;
	return IMM;
}
