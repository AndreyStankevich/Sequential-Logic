library ieee;
use ieee.std_logic_1164.all;

entity test_JKFF is
end test_JKFF;

architecture TB_ARCHITECTURE of test_JKFF is
	component jkff
	port(
		J : in STD_LOGIC;
		K : in STD_LOGIC;
		CLK : in STD_LOGIC;
		Q : out STD_LOGIC;
		nQ : out STD_LOGIC	
		);
	end component;

	signal J : STD_LOGIC := '0';
	signal K : STD_LOGIC := '0';
	signal CLK : STD_LOGIC := '0';
	
	signal Q : STD_LOGIC;
	signal nQ : STD_LOGIC;
begin

	beh : entity Work.JKFF(beh)
		port map (
			J => J,
			K => K,
			CLK => CLK,
			Q => Q,
			nQ => nQ
		);
	
	CLK <= not CLK after 10 ns;
	J <= not J after 20 ns;
	K <= not K after 40 ns;

end TB_ARCHITECTURE;
