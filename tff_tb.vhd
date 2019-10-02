library ieee;
use ieee.std_logic_1164.all;

entity test_TFF is
end test_TFF;

architecture TB_ARCHITECTURE of test_TFF is
	component tff
	port(
		T : in std_logic;
		CLK : in std_logic;
		CLR : in std_logic;
		Q : out std_logic
		);
	end component;

	signal T : std_logic := '0';
	signal CLK : std_logic := '0';
	signal CLR : std_logic := '0';
	
	signal Q : std_logic;
begin
	beh : tff
		port map (
			T => T,			
			Q => Q,
			CLK => CLK,
			CLR => CLR
		);
		
   CLK <= not CLK after 10 ns;
	T <= not T after 80 ns;
	CLR <= '1' after 95 ns when CLR = '0' else '0' after 10 ns;

end TB_ARCHITECTURE;