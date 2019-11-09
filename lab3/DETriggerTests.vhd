LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DETriggerTests IS
END DETriggerTests;
 
ARCHITECTURE Behavioral OF DETriggerTests IS 

    COMPONENT DETrigger
    PORT(
         D : IN  std_logic;
         E : IN  std_logic;
         C : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';
   signal E : std_logic := '0';
   signal C : std_logic := '0';
   
   
   signal assert_result : std_logic;
   signal saved_value : std_logic;

 	--Outputs
   signal Q : std_logic;

   constant clock_period : time := 10 ns;
   constant e_period : time := 7 ns;
   constant d_period : time := 9 ns;
BEGIN

   uut: DETrigger PORT MAP (
          D => D,
          E => E,
          C => C,
          Q => Q
        );

   clock_process :process
   begin
		C <= '0';
		wait for clock_period/2;
		C <= '1';
		wait for clock_period/2;
   end process;
 
   d_process :process
   begin
      D <= '0';
      wait for d_period/2;
      D <= '1';
      wait for d_period/2;
   end process;
   
   e_process :process
   begin
      E <= '0';
      wait for E_period/2;
      E <= '1';
      wait for E_period/2;
   end process;
   
   
   assert_process :process(D,E,C,Q)
   begin
        if rising_edge(C) and (E = '1') then     
           saved_value <= D;
           assert_result <= Q xor D; 
        else     
           assert_result <= saved_value xor Q;        
        end if;        
   end process;
END;
