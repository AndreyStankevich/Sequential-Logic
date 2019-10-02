-- Подаёт на D на выход при E = '1'

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity D_Enable_Latch is
	port (
		D, E : in std_logic;
		Q : out std_logic;
		nQ : out std_logic
		);
end D_Enable_Latch;

architecture struct of D_Enable_Latch is 

	component nor2 
		port (
			A, B: in std_logic;
			Z : out std_logic);
	end component;
	
	component inv
		port (
			A: in std_logic;
			nA: out std_logic);
	end component;
	
	component and2 
		port (
			A, B: in std_logic;
			Z : out std_logic);
	end component;
	
	signal nD, ED, EnotD, T, nT : std_logic;
	
begin
	U1: and2 port map (E, D, ED);
	U2: inv port map (D, nD);
	U3: and2 port map (E, nD, EnotD);
	U4: nor2 port map (ED, T, nT);
	U5: nor2 port map (EnotD, nT, T);
	Q <= T;
	nQ <= nT;
end struct;

architecture beh of D_Enable_Latch is
	signal data : std_logic;
begin	
	data <= D when E = '1';
	Q <= data;
	nQ <= not data;
end beh;

architecture param of D_Enable_Latch is
	signal data : std_logic;
begin
	data <= D when E = '1';
	Q <= data after 3 ns;
	nQ <= not data after 3 ns;
end param;