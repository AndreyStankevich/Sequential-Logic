-- Переход в запрещённое состояние при переходе из 11 в 00

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rs_latch is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end rs_latch;

architecture struct of rs_latch is

    component nor2
	 port(
	     A, B : in std_logic;
		  Z : out std_logic
		  );
	 end component;	  

signal out_1, out_2 : std_logic;
begin 
   NOR_1 : nor2 port map (A => S, B => out_2, Z => out_1);
	NOR_2 : nor2 port map (A => R, B => out_1, Z => out_2);
	Q <= out_2;
	nQ <= out_1;
end struct;

architecture beh of rs_latch is
	signal t1, t2: std_logic;
begin
	t2 <= R nor t1;
	t1 <= S nor t2;
	nQ <= t1;
	Q <= t2;
end beh;

architecture param of rs_latch is
	signal t1, t2: std_logic;
begin
	t2 <= R nor t1 after 3 ns;
	t1 <= S nor t2 after 3 ns;
	nQ <= transport t1 after 3 ns;
	Q <= transport t2 after 3 ns;
end param;