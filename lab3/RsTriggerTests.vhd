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
   signal S : std_logic := '1';
   signal R : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
   signal nQ : std_logic;
   
   
   signal assert_q : std_logic;
   signal assert_nq : std_logic;
   signal saved_q : std_logic;
   signal saved_nq : std_logic;
   signal any_result : std_logic := '1';
   
   constant clock_period : time := 5 ns;
   constant r_period : time := 7 ns;
   constant s_period : time := 9 ns;
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
   
   assert_process: process(R,S,C,Q,nQ)
   begin
        if rising_edge(C) then 
            if S = '0' and R = '1' then 
               any_result <= '1';
               saved_q <= '0';           
               saved_nq <= '1';                       
            elsif S = '1' and R = '0' then 
               any_result <= '1';
               saved_q <= '1';
               saved_nq <= '0';
            elsif S = '1' and R = '1' then 
               any_result <= '0'; -- can be any value here
            --elsif S = '0' and R = '0' then 
            --   any_result <= '1';
            end if;
        end if;
        
        assert_q <= any_result and (saved_q xor Q);
        assert_nq <= any_result and (saved_nq xor nQ);
   end process;
END;
