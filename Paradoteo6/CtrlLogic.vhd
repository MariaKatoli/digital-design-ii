library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity CtrlLogic is 
	generic (n: integer:=8);
	port( Rst,CLK: in std_logic;
			SL_A,SL_B,SL_H,SL_L,SL_C: out std_logic;
			EN_A,EN_B,EN_H,EN_L,EN_C: out std_logic;
			FLAG: out std_logic);
end CtrlLogic;

architecture RTL of CtrlLogic is
type state_type is (LOAD, ADD, SHIFT, FINISH);
signal state: state_type;
signal count: std_logic_vector (n downto 0);
begin 
p0: process(Rst,CLK)
begin	
	if (Rst='1') then
		count <= (n downto 0 => '0');
	elsif (CLK'event and CLK='1') then
		count <= count + '1';
	end if;
end process;
p1: process(Rst,CLK)
begin 
	if (Rst='1') then state <= LOAD;
	elsif (CLK'event and CLK='1') then
		case state is 
			when LOAD=> state <= ADD; 
			when ADD=> state<=SHIFT;
			when SHIFT=> if (conv_integer(count)=2*n) then state <= FINISH; else state <= ADD; end if;
			when FINISH=> null;
		end case;
	end if;
end process;
EN_A <= '1' when (state=LOAD) else '0';
SL_A <= '0';
EN_B <= '1' when (state=LOAD or state=SHIFT) else '0';
SL_B <= '1' when (state=SHIFT) else '0';
EN_H <= '1' when (state=ADD or state=SHIFT) else '0';
SL_H <= '1' when (state=SHIFT) else '0';
EN_L <= '1' when (state=SHIFT) else '0';
SL_L <= '1' when (state=SHIFT) else '0';
EN_C <= '1' when (state=ADD) else '0';
SL_C <= '0';
FLAG <= '1' when (state=FINISH) else '0';
end RTL;