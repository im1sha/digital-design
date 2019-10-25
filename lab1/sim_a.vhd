LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY sim_a IS
END sim_a;
 
ARCHITECTURE behavior OF sim_a IS 
 
    COMPONENT task_a
    Port( KEY1_in : in  STD_LOGIC;
         KEY2_in : in  STD_LOGIC;
         KEY3_in : in  STD_LOGIC;
         KEY4_in : in  STD_LOGIC;
         LED1_out : out  STD_LOGIC);
    END COMPONENT;
    

   --Inputs
   signal KEY1_in : std_logic := '0';
   signal KEY2_in : std_logic := '0';
   signal KEY3_in : std_logic := '0';
   signal KEY4_in : std_logic := '0';

 	--Outputs
   signal LED1_out : std_logic;
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: task_a PORT MAP (
			KEY1_in =>KEY1_in,
			KEY2_in =>KEY2_in,
			KEY3_in =>KEY3_in,
			KEY4_in =>KEY4_in,
			LED1_out =>LED1_out
        );

   process_1 :process
   begin
		KEY1_in <= '0';
				wait for clock_period;
		KEY1_in <= '1';
      wait for clock_period;
   end process;
   
   process_2 :process
   begin
		KEY2_in <= '0';
				wait for clock_period*2;
		KEY2_in <= '1';
      wait for clock_period*2;
   end process;
   
   process_3 :process
   begin
		KEY3_in <= '0';
				wait for clock_period*4;
		KEY3_in <= '1';
      wait for clock_period*4;
   end process;

   process_4 :process
   begin
		KEY4_in <= '0';
				wait for clock_period*8;
		KEY4_in <= '1';
      wait for clock_period*8;
   end process;

END;
