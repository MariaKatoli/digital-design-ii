library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity Adder is
	generic ( n: integer := 4 );
	port ( A, B: in std_logic_vector (n-1 downto 0);
		Sum: out std_logic_vector (n-1 downto 0);
		Cout: out std_logic );
end Adder;

architecture DataFlow of Adder is
	signal F: std_logic_vector (n downto 0);
begin
	F <= ('0' & A) + ('0' & B);
	Cout <= F(n);
	Sum <= F(n-1 downto 0); 
end DataFlow;