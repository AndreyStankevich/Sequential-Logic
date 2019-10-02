library ieee;
use ieee.std_logic_1164.all;

entity test_D_FF_Res_Preset is
end test_D_FF_Res_Preset;

architecture TB_ARCHITECTURE of test_D_FF_Res_Preset is
	component FDCPE
		port(
			CLR : in STD_LOGIC;
			PRE : in STD_LOGIC;
			D : in STD_LOGIC;
			CLK : in STD_LOGIC;
			Q : out STD_LOGIC
			);
	end component;
	
	signal CLR : STD_LOGIC := '0';
	signal PRE : STD_LOGIC := '0';
	signal D : STD_LOGIC := '0';
	signal CLK : STD_LOGIC := '0';
	
	signal Q : STD_LOGIC;	
	
	constant clock : integer := 10;
	constant clock_period : time := clock * 1 ns;
	constant preset_period : time := ((clock * 30) - (clock / 2)) * 1 ns;
	constant clr_period : time := ((clock * 80) - (clock / 2)) * 1 ns;
begin
	beh : entity Work.D_FF_Res_Preset(beh)
	port map (
		CLR => CLR,
		PRE => PRE,
		D => D,
		CLK => CLK,
		Q => Q
		);
		
	CLK <= not CLK after clock_period;
	D <= not D after clock_period * 4;
	PRE <= '1' after preset_period when PRE = '0' else '0' after clock_period / 2;
	CLR <= '1' after clr_period when CLR = '0' else '0' after clock_period / 2;
	
end TB_ARCHITECTURE;