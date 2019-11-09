LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DTriggerAsyncResetTests IS
END DTriggerAsyncResetTests;
 
ARCHITECTURE Behavioral OF DTriggerAsyncResetTests IS 

    COMPONENT DTriggerAsyncReset
    PORT(
         D : IN  std_logic;
         R : IN  std_logic;
         C : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal D : std_logic := '0';
   signal R : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Q : std_logic;
 
   signal assert_result : std_logic;
   signal saved_value : std_logic;

 
   constant clock_period : time := 5 ns;
   constant r_period : time := 9 ns;
   constant d_period : time := 7 ns;
BEGIN

   uut: DTriggerAsyncReset PORT MAP (
          D => D,
          R => R,
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
   
   r_process :process
   begin
      R <= '0';
      wait for r_period/2;
      R <= '1';
      wait for r_period/2;
   end process;
   
   assert_process :process(D, R, C, Q)
   begin  
        if R = '1' then     
           saved_value <= '0';
        elsif rising_edge(C) then 
           saved_value <= D;
        end if;   
        assert_result <= saved_value xor Q;           
   end process;
 END;
