library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Multiplier is
	generic (n: integer := 8);
	port (Rst, CLK, SI : in std_logic;
			I_A,I_B: in std_logic_vector (n-1 downto 0);
			Low , High : out std_logic_vector (n-1 downto 0);
			A_OUT,B_OUT: out std_logic_vector (n-1 downto 0);
			FIN: out std_logic);
end Multiplier;


architecture RTL of Multiplier is
	component Reg
		generic (n: integer);
		port (D_IN: in std_logic_vector (n-1 downto 0);
				SI, CLK, RST, SLOAD, ENABLE: in std_logic;
				SO: out std_logic;
				D_OUT: out std_logic_vector (n-1 downto 0));
	end component;
	component Adder
		generic (n: integer:=8);
		port (A, B: in std_logic_vector (n-1 downto 0);
				SUM: out std_logic_vector (n-1 downto 0);
				COUT: out std_logic);
	end component;
	component CtrlLogic
		generic (n: integer:=8);
		port (Rst, CLK : in std_logic;
				SL_A, SL_B, SL_H, SL_L, SL_C : out std_logic;
				EN_A, EN_B, EN_H, EN_L, EN_C : out std_logic;
				FLAG: out std_logic);
	end component;
	signal SL_A, SL_B, SL_H, SL_L, SL_C, EN_A, EN_B, EN_H, EN_L, EN_C: std_logic;
	signal SO_A, SO_H, F: std_logic;
	signal A, B, SUM, H: std_logic_vector (n-1 downto 0);
	signal C, COUT : std_logic_vector (0 downto 0);	
	begin
	R_A: Reg generic map (n)
				port map (I_A, SI, CLK, RST, SL_A, EN_A, SO_A, A);
	A_OUT <= A;
	R_B: Reg generic map (n)
				port map (I_B, SO_A, CLK, RST, SL_B, EN_B, open, B);
	B_OUT <= B;
	R_C: Reg generic map (n => 1)
				port map (COUT, '0', CLK, RST, SL_C, EN_C, open, C);
	R_H: Reg generic map (n)
				port map (SUM, C(0), CLK, RST, SL_H, EN_H, SO_H, H);
	High <= H;
	R_L: Reg generic map (n)
				port map ((n-1 downto 0 => '0'), SO_H, CLK, RST, SL_L, EN_L, open, Low);
	U_Add: Adder generic map (n)
					 port map (H, ((n-1 downto 0 => B(0)) and A), SUM, COUT(0));
	U_Ctl: CtrlLogic GENERIC MAP (n)
					port map (RST, CLK, SL_A, SL_B, SL_H, SL_L, SL_C, EN_A, EN_B, EN_H, EN_L, EN_C, F);
	FIN<=F;
END RTL;



