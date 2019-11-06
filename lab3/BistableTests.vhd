LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY BistableTests IS
END BistableTests;
 
ARCHITECTURE Behavioral OF BistableTests IS 
    COMPONENT Bistable
    PORT(
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    
 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   signal error : std_logic;
BEGIN
   uut: Bistable PORT MAP (
          Q => Q,
          nQ => nQ
        );

   error <= Q and nQ;
END;
