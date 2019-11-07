LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY RsLatchTests IS
END RsLatchTests;
 
ARCHITECTURE Behavioral OF RsLatchTests IS 
    COMPONENT RsLatch
    PORT(
         S : IN  std_logic;
         R : IN  std_logic;
         nQ : OUT  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal S : std_logic := '0';
   signal R : std_logic := '0';

 	--Outputs
   signal nQ_b, nQ_s, nQ_d : std_logic;
   signal Q_b, Q_s, Q_d : std_logic;
   signal Q_assert, nQ_assert, result_assert : std_logic;
 
   constant clock_period : time := 10 ns;
   constant R_multiplier : integer := 2 ** 0;
   constant S_multiplier : integer := 2 ** 1;
BEGIN
	RsLatch_b: entity work.RsLatch(Behavioral) PORT MAP (
          R => R,
          S => S,
          Q => Q_b,
          nQ => nQ_b
        );

   RsLatch_s: entity work.RsLatch(Structural) PORT MAP (
          R => R,
          S => S,
          Q => Q_s,
          nQ => nQ_s
        );

   RsLatch_d: entity work.RsLatch(Delayed) PORT MAP (
          R => R,
          S => S,
          Q => Q_d,
          nQ => nQ_d
        );

   R_process :process
   begin
      R <= '0';
      wait for clock_period*R_multiplier/2;
		R <= '1';
      wait for clock_period*R_multiplier/2;
   end process;

   S_process :process
   begin
      S <= '0';
      wait for clock_period*S_multiplier/2;
		S <= '1';
      wait for clock_period*S_multiplier/2;
   end process;

   Q_assert <= Q_b xor Q_s;
   nQ_assert <= nQ_b xor nQ_s;
   result_assert <= Q_assert or nQ_assert;
END;
