library IEEE;
use IEEE.std_logic_1164.all;	
entity FULLADDER is
port (A,B,Cin : in std_logic;
		Y, Cout: out std_logic);
end FULLADDER;

architecture behaviour of FULLADDER is
begin 
Y<= (A XOR B) XOR Cin;
Cout<=((A XOR B) AND Cin) OR (A AND B);
end behaviour;
		