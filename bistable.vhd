----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:03:47 09/27/2019 
-- Design Name: 
-- Module Name:    bistable - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bistable is
    Port ( Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end bistable;

architecture Behavioral of bistable is

    component inv
		port (
			A: in std_logic;
			nA: out std_logic
			);
	end component; 

signal S1 : std_logic := '1';
signal nS1 : std_logic;
begin
    INV_1 : inv port map (A => S1, nA => nS1);
	 INV_2 : inv port map (A => nS1, nA => Q);
	 nQ <= nS1;
end Behavioral;

