LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;
 
ENTITY JcGeneratorTests IS
END JcGeneratorTests;
 
ARCHITECTURE Behavioral OF JcGeneratorTests IS
    constant N : integer := 8;
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT JcGenerator
    PORT(
        CLK : IN  std_logic;
        LS : IN  std_logic;
        RST : IN  std_logic;
        Pin : IN  std_logic_vector(0 to N-1);
        Pout : OUT  std_logic_vector(0 to N-1)
        );
    END COMPONENT;
    
    --Inputs
    signal CLK : std_logic := '0';
    signal LS : std_logic := '0';
    signal RST : std_logic := '0';
    signal Pin : std_logic_vector(0 to N-1) 
        := (others => '0');

    --Outputs
    signal Pout : std_logic_vector(0 to N-1);

    -- Clock period definitions
    constant CLK_period : time := 10 ns;
   
BEGIN
    uut: JcGenerator PORT MAP (
        CLK => CLK,
        LS => LS,
        RST => RST,
        Pin => Pin,
        Pout => Pout
        );


    LS_process :process
    begin
        LS <= '0';
        wait for CLK_period;
        LS <= '1';
        wait for CLK_period*N;
        Pin <= Pin + "1";
    end process;

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;
   
END;
