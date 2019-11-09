LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DTriggerAsyncSetTests IS
END DTriggerAsyncSetTests;
 
ARCHITECTURE Behavioral OF DTriggerAsyncSetTests IS 

    COMPONENT DTriggerAsyncSet
    PORT(
         D : IN  std_logic;
         C : IN  std_logic;
         S : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal D : std_logic := '0';
   signal C : std_logic := '0';
   signal S : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
 
 
   signal assert_result : std_logic;
   signal saved_value : std_logic;
   
   
   constant clock_period : time := 5 ns;
   constant s_period : time := 9 ns;
   constant d_period : time := 7 ns;
BEGIN

   uut: DTriggerAsyncSet PORT MAP (
          D => D,
          C => C,
          S => S,
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
   
   s_process :process
   begin
      S <= '0';
      wait for s_period/2;
      S <= '1';
      wait for s_period/2;
   end process;
   
   
   assert_process :process(D, S, C, Q)
   begin  
        if S = '1' then     
           saved_value <= '1';
        elsif rising_edge(C) then 
           saved_value <= D;
        end if;   
        assert_result <= saved_value xor Q;           
   end process;
END;
