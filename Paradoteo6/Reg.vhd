library IEEE;
use IEEE.std_logic_1164.all;

entity Reg is
	generic (n: integer:=4);
	port (
		D_IN: in std_logic_vector (n-1 downto 0);
		SI, CLK, RST, SLOAD, ENABLE: in std_logic;
		SO: out std_logic;
		D_OUT: out std_logic_vector (n-1 downto 0));
end Reg;

architecture RTL of Reg is
signal F: std_logic_vector (n-1 downto 0);
begin 
p0: process (RST, CLK)
begin 
	if (RST='1') then F<=(n-1 downto 0 => '0');
	elsif (CLK'event and CLK='1') then 
		if (ENABLE='1') then
			if (SLOAD='0') then F<=D_IN;
			else F<=SI & F(n-1 downto 1);
			end if;
		end if;
	end if;
end process;
D_OUT<=F;
SO<=F(0);
end RTL;