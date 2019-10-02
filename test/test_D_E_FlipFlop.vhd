library ieee;
use ieee.std_logic_1164.all;

entity test_D_E_FlipFlop is
end test_D_E_FlipFlop;

architecture TB_ARCHITECTURE of test_D_E_FlipFlop is
	component D_FlipFlop
	port(
		D : in std_logic;
		CLK, E : in std_logic;
		Q : out std_logic );
	end component;


	signal D : std_logic := '0';
	signal CLK : std_logic := '0';
	signal E : std_logic := '0';

	signal Q : std_logic;
	
begin
	beh : entity Work.D_E_FlipFlop(beh)
		port map (
			D => D,
			CLK => CLK,
			E => E,
			Q => Q
		);	  
	
	D <= not D after 40 ns;
	E <= not E after 20 ns;
	CLK <= not CLK after 10 ns;
end TB_ARCHITECTURE;	
