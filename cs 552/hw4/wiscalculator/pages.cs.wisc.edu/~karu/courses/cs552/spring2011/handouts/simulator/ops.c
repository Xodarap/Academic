extern int dest_reg;
extern int dest_val;
extern int dest_addr;
extern int dest_mem_val;

unsigned int SignExt5_16()
{
  if(IMM5&0x0010){
    return IMM5 | 0xFFE0;
  }
  return IMM5;
}

unsigned int SignExt5_32()
{
  if(IMM5&0x0010){
    return IMM5 | 0xFFFFFFE0;
  }
  return IMM5;
}

unsigned int SignExt8_16()
{
  if(IMM8&0x0080){
    return IMM8 | 0xFF00;
  }
  return IMM8;
}

unsigned int SignExt8_32()
{
  if(IMM8&0x0080){
    return IMM8 | 0xFFFFFF00;
  }
  return IMM8;
}

unsigned int SignExtDisp_16()
{
  if(DISP&0x0400){
    return DISP | 0xF800;
  }
  return DISP;
}

unsigned int SignExtDisp_32()
{
  if(DISP&0x0400){
    return DISP | 0xF800;
  }
  return DISP;
}

unsigned int SignExtReg_32(unsigned int reg)
{
  if(reg&0x8000){
    return reg | 0xFFFF0000;
  }
  return reg;
}

void ex()
{
  if(SHOWINST) printf("exception: Illegal Opcode\n");
  REG[EPC] = REG[PC];
  REG[PC] = 2;
  dest_reg = -1;
}

void nop()
{
  if(SHOWINST) printf("nop\n");
}


void rti()
{
  if(SHOWINST) printf("rti\n");
  REG[PC] = REG[EPC];
  dest_reg = -1;
}

void addi()
{
  if(SHOWINST) printf("addi %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), SignExt5_32());
  REG[RDI]=(0x0000FFFF)&(REG[RS]+SignExt5_16());
  dest_reg = RDI;
  dest_val = REG[dest_reg];
}

void subi()
{
  if(SHOWINST) printf("subi %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), SignExt5_32());
  REG[RDI]=(0x0000FFFF)&(SignExt5_16()-REG[RS]);
  dest_reg = RDI;
  dest_val = REG[dest_reg];
}

void xori()
{
  if(SHOWINST) printf("xori %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), IMM5);
  REG[RDI] = (0x0000FFFF)&(REG[RS] ^ IMM5);
  dest_reg = RDI;
  dest_val = REG[dest_reg];
}

void andni()
{
  if(SHOWINST) printf("andni %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), IMM5);
  REG[RDI] = (0x0000FFFF)&(REG[RS] & ~((short) IMM5));
  dest_reg = RDI;
  dest_val = REG[dest_reg];
}

void roli()
{
  if(SHOWINST) printf("roli %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), IMM5&0xF);
  REG[RDI] = (REG[RS] << (IMM5&0xF))
    | (REG[RS] >> (16-(IMM5&0xF)));
  REG[RDI] &= 0x0000FFFF;
  dest_reg = RDI;
  dest_val = REG[dest_reg];
}

void slli()
{
  if(SHOWINST) printf("slli %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), IMM5&0xF);
  REG[RDI] = REG[RS] << (IMM5&0xF);
  REG[RDI] &= 0x0000FFFF;
  dest_reg = RDI;
  dest_val = REG[dest_reg];
}

void rori()
{
  if(SHOWINST) printf("rori %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), IMM5&0xF);
  REG[RDI] = (REG[RS] >> (IMM5&0xF))
    | (REG[RS] << (16-(IMM5&0xF)));
  REG[RDI] &= 0x0000FFFF;
  dest_reg = RDI;
  dest_val = REG[dest_reg];
}

void srli()
{
  if(SHOWINST) printf("srli %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), IMM5&0xF);
  REG[RDI] = REG[RS] >> (IMM5&0xF);
  REG[RDI] &= 0x0000FFFF;
  dest_reg = RDI;
  dest_val = REG[dest_reg];
}

void st()
{
  if(SHOWINST) printf("st %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), SignExt5_32());
  WriteDMemory(0x0000FFFF&(SignExtReg_32(REG[RS])+SignExt5_32()), REG[RDI]);
  dest_reg = -1;
  dest_val = REG[RDI];
  dest_addr = 0x0000FFFF&(SignExtReg_32(REG[RS])+SignExt5_32());
}

void ld()
{
   if(SHOWINST) printf("ld %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), SignExt5_32()); 
   dest_addr = 0xFFFF&(SignExtReg_32(REG[RS])+SignExt5_32());
   REG[RDI] = ReadDMemory(0xFFFF&(SignExtReg_32(REG[RS])+SignExt5_32()));
   dest_reg = RDI;
   dest_val = REG[dest_reg];
}

void stu()
{
  if(SHOWINST) printf("stu %s, %s, %i\n", 
		      formatRegName(RDI), formatRegName(RS), SignExt5_32());
  dest_mem_val = REG[RDI];
  WriteDMemory(0xFFFF&(SignExtReg_32(REG[RS])+SignExt5_32()), REG[RDI]);
  dest_addr = 0x0000FFFF&(SignExtReg_32(REG[RS]) + SignExt5_32());
  REG[RS] = 0x0000FFFF&(SignExtReg_32(REG[RS]) + SignExt5_32());
  dest_reg = RS;
  dest_val = REG[RS];

}

void btr()
{
  int i;
  int temp=0;
  if(SHOWINST) printf("btr %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS));
  for(i=0;i<16;i++){
    if(i<8){
      temp |= (REG[RS]&(1<<i))<<(15-i*2);
    }
    else{
      temp |= (REG[RS]&(1<<i))>>(i-(15-i));
    }
  }
  REG[RDR] = 0x0000FFFF&(temp);
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void add()
{
  if(SHOWINST) printf("add %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR]=0x0000FFFF&(SignExtReg_32(REG[RS])+SignExtReg_32(REG[RT]));
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void sub()
{
  if(SHOWINST) printf("sub %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR]=0x0000FFFF&(SignExtReg_32(REG[RT])-SignExtReg_32(REG[RS]));
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void xor()
{
  if(SHOWINST) printf("xor %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = 0x0000FFFF&(SignExtReg_32(REG[RS])^SignExtReg_32(REG[RT]));
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void andn()
{
  if(SHOWINST) printf("andn %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = 0x0000FFFF&((0xFFFF&(REG[RS])) & (0xFFFF&(~REG[RT])));
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void rol()
{
  if(SHOWINST) printf("rol %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = (REG[RS] << (REG[RT]&0xF))
  | (REG[RS] >> (16-(REG[RT]&0xF)));
  REG[RDR] &= 0x0000FFFF;
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void sll()
{
  if(SHOWINST) printf("sll %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = REG[RS] << (REG[RT]&0xF);
  REG[RDR] &= 0x0000FFFF;
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void ror()
{
  if(SHOWINST) printf("ror %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = (0xFFFF&(REG[RS]) >> (REG[RT]&0xF))
    | (0xFFFF&(REG[RS]) << (16-(REG[RT]&0xF)));
  REG[RDR] &= 0x0000FFFF;
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void srl()
{
  if(SHOWINST) printf("srl %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = REG[RS] >> (REG[RT]&0xF);
  REG[RDR] &= 0x0000FFFF;
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void seq()
{
  if(SHOWINST) printf("seq %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = ((0xFFFF&REG[RT])==(0xFFFF&REG[RS]))?1:0;
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void slt()
{
  if(SHOWINST) printf("slt %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = (((int)SignExtReg_32(REG[RS]))<((int)SignExtReg_32(REG[RT])))?1:0;
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void sle()
{
  if(SHOWINST) printf("sle %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = ((int)SignExtReg_32(REG[RS])<=(int)SignExtReg_32(REG[RT]))?1:0;
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void sco()
{
  if(SHOWINST) printf("sco %s, %s, %s\n", 
		      formatRegName(RDR), formatRegName(RS), formatRegName(RT));
  REG[RDR] = (0x10000&( (0xFFFF&REG[RS])+ (0xFFFF&REG[RT]) ))?1:0;
  dest_reg = RDR;
  dest_val = REG[dest_reg];
}

void beqz()
{
  if(SHOWINST) printf("beqz %s, %i\n", 
		      formatRegName(RS), SignExt8_32());
  if(REG[RS] == 0){
    REG[PC] = 0x0000FFFF& (SignExtReg_32(REG[PC]) + SignExt8_32()); //PC already equals PC + 2
  }
  dest_reg = -1;
}

void bnez()
{
  if(SHOWINST) printf("bnez %s, %i\n", 
		      formatRegName(RS), SignExt8_32());
  if(REG[RS] != 0){
    REG[PC] = 0x0000FFFF&(SignExtReg_32(REG[PC]) + SignExt8_32()); //PC already equals PC + 2
  }
  dest_reg = -1;
}

void bltz()
{
  if(SHOWINST) printf("bltz %s, %i\n", 
		      formatRegName(RS), SignExt8_32());
  if((int)SignExtReg_32(REG[RS]) < 0){
    REG[PC] = 0x0000FFFF&(SignExtReg_32(REG[PC]) + SignExt8_32()); //PC already equals PC + 2
  }
  dest_reg = -1;
}

void bgez()
{
  if(SHOWINST) printf("bgez %s, %i\n", 
		      formatRegName(RS), SignExt8_32());
  if((int)SignExtReg_32(REG[RS]) >= 0){
    REG[PC] = 0x0000FFFF&(SignExtReg_32(REG[PC]) + SignExt8_32()); //PC already equals PC + 2
  }
  dest_reg = -1;
}

void lbi()
{
  if(SHOWINST) printf("lbi %s, %i\n", 
		      formatRegName(RS), SignExt8_32());
  REG[RS] = SignExt8_16();
  dest_reg = RS;
  dest_val = REG[dest_reg];
}

void slbi()
{
  if(SHOWINST) printf("slbi %s, %i\n", 
		      formatRegName(RS), SignExt8_32());
  REG[RS] = 0xFFFF&(REG[RS]<<8 | IMM8);
  dest_reg = RS;
  dest_val = REG[RS];
}

void j()
{
  if(SHOWINST) printf("j %i\n", 
		      SignExtDisp_32());
  REG[PC] = 0x0000FFFF&(SignExtReg_32(REG[PC]) + SignExtDisp_32());
  dest_reg = -1;
}

void jr()
{
  if(SHOWINST) printf("jr %s, %i",
		      formatRegName(RS), SignExt8_32());
  REG[PC] = 0x0000FFFF&(SignExtReg_32(REG[RS]) + SignExt8_32());
  dest_reg = -1;
}

void jal()
{
  if(SHOWINST) printf("jal %i\n", 
		      SignExtDisp_32());
  REG[R7] = REG[PC];
  REG[PC] = 0x0000FFFF&(SignExtReg_32(REG[PC]) + SignExtDisp_32());
  dest_reg = R7;
  dest_val = REG[dest_reg];
}

void jalr()
{
  if(SHOWINST) printf("jalr %s, %i\n",
		      formatRegName(RS),SignExt8_32());
  int old_PC = REG[PC];
  REG[PC] = 0x0000FFFF&(SignExtReg_32(REG[RS]) + SignExt8_32());
  REG[R7] = old_PC;
  dest_reg = R7;
  dest_val = REG[dest_reg];
}
