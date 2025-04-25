library	IEEE;
use	IEEE.std_logic_1164.all;
entity DFLIPFLOP is																
	port (	 CLK,	D,	CLR, SET, EN:	in		std_logic;
				 Q,	Qn		:	out	std_logic );
end DFLIPFLOP;

architecture	RTL	of DFLIPFLOP is
		 signal	DFF	:	std_logic;
begin
		 seq0	:	process (CLK, CLR, SET, EN )
		 begin
					if (EN='0') then DFF<='0';
					elsif	(CLR='1')	then DFF<='0';
					elsif	(SET='1')	then DFF<='1';
					elsif (CLK'event	and	CLK	=	'1')	then	DFF	<=D;	
				end	if;
		 end	process;
		 Q	<=	DFF;	Qn	<=	not	DFF;
end RTL;