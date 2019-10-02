LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_rs_latch IS
END test_rs_latch;
 
ARCHITECTURE behavior OF test_rs_latch IS 
 
    COMPONENT rs_latch
    PORT(
         S : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
	signal Q_param : std_logic;
   signal nQ_param : std_logic;
 
BEGIN
 
   struct : entity Work.rs_latch(struct)
	port map (
		R => R,
		S => S,
		Q => Q,
		nQ => nQ
		);	

   param : entity Work.rs_latch(param)
	port map (
		R => R,
		S => S,
		Q => Q_param,
		nQ => nQ_param
		);	  		
		
	beh : entity Work.rs_latch(beh)
	port map (
		R => R,
		S => S,
		Q => Q_param,
		nQ => nQ_param
		);	  			
		
   Simulate: process
	begin	  		
		
		R <= '1';
		S <= '1';
		wait for 20 ns;	
		
      R <= '0';
		S <= '0';
		wait for 20 ns;
		
	end process;		
   
END;
