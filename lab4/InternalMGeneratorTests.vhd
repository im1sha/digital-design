LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY InternalMGeneratorTests IS
END InternalMGeneratorTests;
 
ARCHITECTURE Behavioral OF InternalMGeneratorTests IS
    -- Component Declaration for the Unit Under Test (UUT)
    constant N : integer := 12;
    COMPONENT InternalMGenerator
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Pout : OUT  std_logic_vector(0 to N-1)
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal Pout : std_logic_vector(0 to N-1);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: InternalMGenerator PORT MAP (
          CLK => CLK,
          RST => RST,
          Pout => Pout
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
END;
