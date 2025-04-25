library IEEE;
use IEEE.std_logic_1164.all;	
entity MUX4_1	is
port	(	 D	:	in	std_logic_vector	(3	downto 0);
SEL:	in	std_logic_vector	(1	downto 0);
Y:	out	std_logic);
end	MUX4_1;	
architecture	RTL4_1 of	MUX4_1	is
begin
Y	<=	D(0)	when	SEL="00"	else	D(1)	when	SEL="01"	else	D(2)	when	SEL="10"	else	D(3);
end RTL4_1;