library IEEE;
use IEEE.std_logic_1164.all;	
entity Adder8 is
port	(	 A,	B :	 in	std_logic_vector	(7 downto 0);
	Cin	:	 in	std_logic;
	Y:	 out std_logic_vector	(7 downto 0);
	Cout:	 out	std_logic );

end Adder8;	
architecture RTL of Adder8 is 
component FULLADDER
port (A,B,Cin : in std_logic;
		Y, Cout: out std_logic);
end component;
signal F: std_logic_vector (6 downto 0);
begin 
	u0: FULLADDER port map(A(0),B(0),Cin,Y(0),F(0));
	u1: FULLADDER port map(A(1),B(1),F(0),Y(1),F(1));
	u2: FULLADDER port map(A(2),B(2),F(1),Y(2),F(2));
	u3: FULLADDER port map(A(3),B(3),F(2),Y(3),F(3));
	u4: FULLADDER port map(A(4),B(4),F(3),Y(4),F(4));
	u5: FULLADDER port map(A(5),B(5),F(4),Y(5),F(5));
	u6: FULLADDER port map(A(6),B(6),F(5),Y(6),F(6));
	u7: FULLADDER port map(A(7),B(7),F(6),Y(7),Cout);
end RTL;