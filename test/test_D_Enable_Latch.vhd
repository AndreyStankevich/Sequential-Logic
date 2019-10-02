library ieee;
use ieee.std_logic_1164.all;

entity test_D_Enable_Latch is
end test_D_Enable_Latch;

architecture TB_ARCHITECTURE of test_D_Enable_Latch is
	component d_enable_latch
	port(
		D : in std_logic;
		E : in std_logic;
		Q : out std_logic;
		nQ : out std_logic );
	end component;


	signal D : std_logic := '0';
	signal E : std_logic := '0';

	signal Q_struct : std_logic;
	signal nQ_struct : std_logic;	 
	
	signal Q_beh : std_logic;
	signal nQ_beh : std_logic;
	
	signal Q_param : std_logic;
	signal nQ_param : std_logic;   
	
begin
	struct: entity Work.D_Enable_Latch(struct)
	port map (
		D => D,
		E => E,
		Q => Q_struct,
		nQ => nQ_struct
	);	 
		
	beh : entity Work.D_Enable_Latch(beh)
	port map (
		D => D,
		E => E,
		Q => Q_beh,
		nQ => nQ_beh
	);
	
	param : entity Work.D_Enable_Latch(param)
	port map (
		D => D,
		E => E,
		Q => Q_param,
		nQ => nQ_param
	);
	
	D <= not D after 10 ns;
	E <= '1' after 40 ns when E = '0' else '0' after 10 ns;	

end TB_ARCHITECTURE;