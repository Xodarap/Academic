import Numeric
import Data.Char

dodisp n = 
  let sn = show n
  in "onebitreg r" ++ sn ++ "(.readdata(readdata[" ++ sn ++"]), .clk(clk), .rst(rst), .writedata(writedata[" ++ sn ++"]), .write(write));"
     
singlereg n =     
  let pattern = showIntAtBase 2 intToDigit n ""      
  in "case " ++ pattern ++ ": readDataReg = readDatas[" ++ (show n) ++ "];"
     
writereg n =
  let pattern = showIntAtBase 2 intToDigit n ""        
      sn = show n
  in "reg16 r" ++ sn ++ "(.readdata(readDatas[" ++ sn ++ "]), .clk(clk), .rst(rst), .writedata(writedata), .write(writeEnable[" ++ sn ++ "]));"
     
assignreg n =     
  let pattern = showIntAtBase 2 intToDigit n ""         
      sn = show n
  in "assign writeEnable[" ++ sn ++ "] = write & (&(~(3'b" ++ pattern ++ " ^ writeregsel)));"