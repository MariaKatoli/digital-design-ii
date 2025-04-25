library	IEEE;
use	IEEE.std_logic_1164.all;
use	IEEE.std_logic_unsigned.all;

entity Counter8 is																
		port (CLK ,	CLR, SET, EN:	in		std_logic;
				Q:	out	std_logic_vector(7 downto 0));
end Counter8;


architecture RTL of Counter8 is
		 signal sum: std_logic_vector(7 downto 0);
	begin
		seq0 : process (CLK, CLR, SET)
			begin
					if	(CLR='1') then sum<=(7 downto 0 => '0');
					elsif	(SET='1') then sum<=(7 downto 0 => '1');
					elsif (CLK'event and CLK='1' and EN='1')	then	sum<=(sum + '1');	
					end	if;
		end	process;
		Q<=sum;		
end RTL;