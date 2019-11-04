library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

ENTITY FAx2Tests IS
END FAx2Tests;
 
ARCHITECTURE Behavioral OF FAx2Tests IS 

    COMPONENT FAx2Attach
      Port (   a         : in  STD_LOGIC_VECTOR (1 downto 0); -- operand A
               b         : in  STD_LOGIC_VECTOR (1 downto 0); -- operand B
               c_in      : in  STD_LOGIC;
               s_b       : out STD_LOGIC_VECTOR (1 downto 0);
               c_out_b   : out STD_LOGIC;
               s_s       : out STD_LOGIC_VECTOR (1 downto 0);
               c_out_s   : out STD_LOGIC
               );
    END COMPONENT;

   --Inputs
   signal a : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
   signal b : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
   signal c_in : std_logic := '0';

 	--Outputs
   signal c_out_s, 
          c_out_b : std_logic;
   signal s_s, 
          s_b : STD_LOGIC_VECTOR (1 downto 0);
 
   signal assert_signal : std_logic;
 
   constant clock_period : time := 10 ns;
	
   constant a_clock_multiplier : integer := 2 ** 1;
   constant b_clock_multiplier : integer := 2 ** 2;
   constant c_clock_multiplier : integer := 2 ** 3;    

BEGIN

   uut: FAx2Attach PORT MAP (
          a => a,
          b => b,
          c_in => c_in,
          s_b => s_b,
          c_out_b => c_out_b,
          s_s  => s_s,
          c_out_s => c_out_s                              
        );   

   a_process : process
   begin
		wait for clock_period*a_clock_multiplier/2;	
        a <= a + "1";
   end process;

   b_process : process
   begin
		wait for clock_period*b_clock_multiplier/2;
		b <= b + "1";
   end process;
   
   c_process : process
   begin
		c_in <= '0';
		wait for clock_period*c_clock_multiplier/2;
		c_in <= '1';
		wait for clock_period*c_clock_multiplier/2;
   end process;
	
    assert_process: process(c_out_b, c_out_s, s_b, s_s)
    begin
        if ((c_out_s = c_out_b) and (s_s = s_b)) then
            assert_signal <= '0';
        else 
            assert_signal <= '1';
        end if;
    end process;
	
END;