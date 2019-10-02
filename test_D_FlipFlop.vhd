library ieee;
use ieee.std_logic_1164.all;

entity test_D_FlipFlop is
end test_D_FlipFlop;

architecture TB_ARCHITECTURE of test_D_FlipFlop is
	component D_FlipFlop
	port(
		D : in std_logic;
		CLK : in std_logic;
		Q : out std_logic );
	end component;


	signal D : std_logic := '0';
	signal CLK : std_logic := '0';

	signal Q : std_logic;
	
begin
	beh : D_FlipFlop
		port map (
			D => D,
			CLK => CLK,
			Q => Q
		);	  
	
	D <= not D after 40 ns;
	CLK <= not CLK after 10 ns;
end TB_ARCHITECTURE;	
