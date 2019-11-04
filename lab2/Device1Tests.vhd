LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Device1Tests IS
END Device1Tests;
 
ARCHITECTURE Behavioral OF Device1Tests IS 

    COMPONENT Device1Attach
    PORT(
         x : IN  std_logic;
         y : IN  std_logic;
         z : IN  std_logic;
         f_b : OUT  std_logic;
         f_s : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal x : std_logic := '0';
   signal y : std_logic := '0';
   signal z : std_logic := '0';

 	--Outputs
   signal f_s, f_b, assert_signal : std_logic;
 
   constant clock_period : time := 10 ns;
	
   constant x_clock_multiplier : integer := 2 ** 1;
   constant y_clock_multiplier : integer := 2 ** 2;
   constant z_clock_multiplier : integer := 2 ** 3;    

BEGIN

   uut: Device1Attach PORT MAP (
          x => x,
          y => y,
          z => z,
          f_b => f_b,
          f_s => f_s			 
        );   

   x_process : process
   begin
		X <= '0';
		wait for clock_period*x_clock_multiplier/2;
		X <= '1';
		wait for clock_period*x_clock_multiplier/2;
   end process;

   y_process : process
   begin
		Y <= '0';
		wait for clock_period*y_clock_multiplier/2;
		Y <= '1';
		wait for clock_period*y_clock_multiplier/2;
   end process;

   z_process : process
   begin
		Z <= '0';
		wait for clock_period*z_clock_multiplier/2;
		Z <= '1';
		wait for clock_period*z_clock_multiplier/2;
   end process;
	
	assert_process: process(f_b, f_s)
	begin
		if (f_b = f_s) then
			assert_signal <= '0';
		else 
			assert_signal <= '1';
		end if;
	end process;
	
END;