library	IEEE;
use	IEEE.std_logic_1164.all;

entity Reg8 is																
		port (CLK ,	CLR, SET, EN:	in		std_logic;
				I: in std_logic_vector(7 downto 0);
				Q:	out	std_logic_vector(7 downto 0));
end Reg8;


architecture RTL of Reg8 is
		 signal DFF: std_logic_vector(7 downto 0);
	begin
		seq0 : process (CLK, CLR, SET)
			begin
					if	(CLR='1') then DFF<=(7 downto 0 => '0');
					elsif	(SET='1') then DFF<=(7 downto 0 => '1');
					elsif (CLK'event	and	CLK	=	'1' and EN='1') then DFF<=I;	
					end	if;
		end	process;
		Q	<=	DFF;		
end RTL;