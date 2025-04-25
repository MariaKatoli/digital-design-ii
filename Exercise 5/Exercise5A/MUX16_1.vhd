library IEEE;
use IEEE.std_logic_1164.all;	

entity MUX16_1	is
port	(	 D	:	in	std_logic_vector	(15	downto 0);
SEL:	in	std_logic_vector	(3	downto 0);
Y:	out	std_logic );
end	MUX16_1;	

architecture	RTL	of	MUX16_1	is
component MUX4_1
port	(	 D	:	in	std_logic_vector	(3	downto 0);
SEL:	in	std_logic_vector	(1	downto 0);
Y:	out	std_logic );
end	component;
signal	F :	std_logic_vector	(3	downto 0);
begin
u0:	MUX4_1	port	map	(D	=>	D(3	downto	0),	 SEL	=>	SEL(1	downto	0),	Y	=>	F(0));
u1:	MUX4_1	port	map	(D	=>	D(7	downto	4),	 SEL	=>	SEL(1	downto	0),	Y	=>	F(1));
u2:	MUX4_1	port	map	(D	=>	D(11	downto	8),	 SEL	=>	SEL(1	downto	0),	Y	=>	F(2));
u3:	MUX4_1	port	map	(D	=>	D(15	downto	12), SEL	=>	SEL(1	downto	0),	Y	=>	F(3));
u4:	MUX4_1	port	map	(D	=>	F(3	downto	0),	 SEL	=>	SEL(3 downto	2),	Y	=>	Y);
end RTL;