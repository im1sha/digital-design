LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY sim_d IS
END sim_d;
 
ARCHITECTURE behavior OF sim_d IS 
 
    COMPONENT task_d
    Port( KEY11_in : in  STD_LOGIC;
         KEY12_in : in  STD_LOGIC;
         KEY21_in : in  STD_LOGIC;
         KEY22_in : in  STD_LOGIC;
         KEY_SELECT : in  STD_LOGIC;
         LED1_out : out  STD_LOGIC;
         LED2_out : out  STD_LOGIC
			);
    END COMPONENT;
    

   --Inputs
   signal KEY11_in : std_logic := '0';
   signal KEY12_in : std_logic := '0';
   signal KEY21_in : std_logic := '0';
   signal KEY22_in : std_logic := '0';
   signal KEY_SELECT : std_logic := '0';

 	--Outputs
   signal LED1_out : std_logic;
   signal LED2_out : std_logic;
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: task_d PORT MAP (
			KEY11_in =>KEY11_in,
			KEY12_in =>KEY12_in,
			KEY21_in =>KEY21_in,
			KEY22_in =>KEY22_in,
			KEY_SELECT =>KEY_SELECT,
			LED1_out =>LED1_out,
			LED2_out =>LED2_out
        );

   process_1 :process
   begin
		KEY11_in <= '0';
				wait for clock_period;
		KEY11_in <= '1';
      wait for clock_period;
   end process;
   
   process_2 :process
   begin
		KEY12_in <= '0';
				wait for clock_period*2;
		KEY12_in <= '1';
      wait for clock_period*2;
   end process;
   
   process_3 :process
   begin
		KEY21_in <= '0';
				wait for clock_period*4;
		KEY21_in <= '1';
      wait for clock_period*4;
   end process;

   process_4 :process
   begin
		KEY22_in <= '0';
				wait for clock_period*8;
		KEY22_in <= '1';
      wait for clock_period*8;
   end process;

	process_5 :process
   begin
		KEY_SELECT <= '0';
				wait for clock_period*16;
		KEY_SELECT <= '1';
      wait for clock_period*16;
   end process;

END;
