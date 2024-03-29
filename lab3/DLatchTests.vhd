LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DLatchTests IS
END DLatchTests;
 
ARCHITECTURE Behavioral OF DLatchTests IS 

    COMPONENT DLatch
    PORT(
         D : IN  std_logic;
         Q : OUT  std_logic;
         nQ : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';

 	--Outputs
   signal Q_b, Q_s, Q_d : std_logic;
   signal nQ_b, nQ_s, nQ_d : std_logic;
   signal Q_assert, nQ_assert,result_assert : std_logic;
   
   constant clock_period : time := 10 ns;
   
BEGIN
	DLatch_b: entity work.DLatch(Behavioral) PORT MAP (
          D => D,
          Q => Q_b,
          nQ => nQ_b
        );

   DLatch_s: entity work.DLatch(Structural) PORT MAP (
          D => D,
          Q => Q_s,
          nQ => nQ_s
        );

   DLatch_d: entity work.DLatch(Delayed) PORT MAP (
          D => D,
          Q => Q_d,
          nQ => nQ_d
        );

   D_process : process
   begin
		D <= '0';
		wait for clock_period/2;
		D <= '1';
		wait for clock_period/2;
   end process;
   
   Q_assert <= Q_s xor Q_b;
   nQ_assert <= nQ_s xor nQ_b;
   result_assert <= Q_assert or nQ_assert;
END;
