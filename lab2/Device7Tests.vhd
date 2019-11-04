LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Device7Tests IS
END Device7Tests;
 
ARCHITECTURE Behavioral OF Device7Tests IS 

    COMPONENT Device7Attach
    PORT(
	      w : IN  std_logic;
         x : IN  std_logic;
         y : IN  std_logic;
         z : IN  std_logic;
         g_b : OUT  std_logic;
         g_s : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal w : std_logic := '0';
   signal x : std_logic := '0';
   signal y : std_logic := '0';
   signal z : std_logic := '0';

 	--Outputs
   signal g_s, g_b, assert_signal : std_logic;
 
   constant clock_period : time := 10 ns;
	
   constant w_clock_multiplier : integer := 2 ** 0;
   constant x_clock_multiplier : integer := 2 ** 1;
   constant y_clock_multiplier : integer := 2 ** 2;
   constant z_clock_multiplier : integer := 2 ** 3;    

BEGIN

   uut: Device7Attach PORT MAP (
          w => w,
          x => x,
          y => y,
          z => z,
          g_b => g_b,
          g_s => g_s			 
        );   
   w_process : process
   begin
		w <= '0';
		wait for clock_period*w_clock_multiplier/2;
		w <= '1';
		wait for clock_period*w_clock_multiplier/2;
   end process;

   x_process : process
   begin
		x <= '0';
		wait for clock_period*x_clock_multiplier/2;
		x <= '1';
		wait for clock_period*x_clock_multiplier/2;
   end process;

   y_process : process
   begin
		y <= '0';
		wait for clock_period*y_clock_multiplier/2;
		y <= '1';
		wait for clock_period*y_clock_multiplier/2;
   end process;

   z_process : process
   begin
		z <= '0';
		wait for clock_period*z_clock_multiplier/2;
		z <= '1';
		wait for clock_period*z_clock_multiplier/2;
   end process;
	
	assert_process: process(g_b, g_s)
	begin
		if (g_b = g_s) then
			assert_signal <= '0';
		else 
			assert_signal <= '1';
		end if;
	end process;
	
END;