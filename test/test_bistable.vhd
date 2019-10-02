LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY test_bistable IS
END test_bistable;
 
ARCHITECTURE behavior OF test_bistable IS 
 
    COMPONENT BistableElement
    PORT(
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    
 	--Outputs
   signal out_Q : std_logic;
   signal out_nQ : std_logic;
 
BEGIN
    behavioral : entity Work.bistable(Behavioral)
	 port map (
		 Q => out_Q,
		 nQ => out_nQ
		 );	 
END;
