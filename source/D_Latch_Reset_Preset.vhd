library IEEE;
use IEEE.std_logic_1164.all;

entity D_Latch_Reset_Preset is
	port(
		CLR : in std_logic;
		PRE : in std_logic;
		D : in std_logic;
		E : in std_logic;	
		Q : out std_logic
		);
end D_Latch_Reset_Preset;

architecture beh of D_Latch_Reset_Preset is
	signal s: std_logic;
begin
	process(CLR, PRE, D, E)
	begin
		if CLR = '1' then
			s <= '0';
		elsif PRE = '1' then
			s <= '1';
		elsif E = '1' then
				s <= D;
		end if;
	end process; 
	
	Q <= s;
end beh;