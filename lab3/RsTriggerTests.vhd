LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RsTriggerTests IS
END RsTriggerTests;
 
ARCHITECTURE Behavioral OF RsTriggerTests IS 

    COMPONENT RsTrigger
    PORT(
         R : IN  std_logic;
         S : IN  std_logic;
         C : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal S : std_logic := '0';
   signal R : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
 
   constant clock_period : time := 10 ns;
   constant r_period : time := clock_period/2 + 2 ns;
   constant s_period : time := r_period/2;
BEGIN

   uut: RsTrigger PORT MAP (  
          R => R,
          S => S,
          C => C,
          Q => Q,
          nQ => nQ
        );

   clock_process :process
   begin
		C <= '0';
		wait for clock_period/2;
		C <= '1';
		wait for clock_period/2;
   end process;
 
   r_process :process
   begin
      R <= '0';
      wait for r_period/2;
      R <= '1';
      wait for r_period/2;
   end process;
   
   s_process :process
   begin
      S <= '0';
      wait for s_period/2;
      S <= '1';
      wait for s_period/2;
   end process;
END;
