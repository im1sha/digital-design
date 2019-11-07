LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DELatchTests IS
END DELatchTests;
 
ARCHITECTURE Behavioral OF DELatchTests IS 

    COMPONENT DELatch
    PORT(
         D : IN  std_logic;
         E : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal Q_b, Q_s, Q_d : std_logic;
   signal nQ_b, nQ_s, nQ_d : std_logic;
   signal Q_assert, nQ_assert, result_assert : std_logic;
 
   constant clock_period : time := 10 ns;
   constant D_multiplier : integer := 2 ** 0;
   constant E_multiplier : integer := 2 ** 1;
   
BEGIN
	DELatch_b: entity work.DELatch(Behavioral) PORT MAP (
          D => D,
          E => E,
          Q => Q_b,
          nQ => nQ_b
        );

   DELatch_s: entity work.DELatch(Structural) PORT MAP (
          D => D,
          E => E,
          Q => Q_s,
          nQ => nQ_s
        );

   DELatch_d: entity work.DELatch(Delayed) PORT MAP (
          D => D,
          E => E,
          Q => Q_d,
          nQ => nQ_d
        );

   D_process : process
   begin
		D <= '0';
		wait for clock_period*D_multiplier/2;
		D <= '1';
		wait for clock_period*D_multiplier/2;
   end process;
 
   E_process :process
   begin
		E <= '1';
		wait for clock_period*E_multiplier/2;
		E <= '0';
		wait for clock_period*E_multiplier/2;
   end process;
   
   Q_assert <= Q_b xor Q_s;
   nQ_assert<= nQ_b xor nQ_s;
   result_assert <= Q_assert or nQ_assert;
END;
