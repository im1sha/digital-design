library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 2-bit adder with carry lookahead

entity FAx2 is
    Port ( 
           a       : in  STD_LOGIC_VECTOR (1 downto 0); -- operand A
           b       : in  STD_LOGIC_VECTOR (1 downto 0); -- operand B
           c_in    : in  STD_LOGIC;
           s       : out STD_LOGIC_VECTOR (1 downto 0);
           c_out   : out STD_LOGIC);
end FAx2;

architecture Structural of FAx2 is
component FullAdder
      Port ( 
           a      : in   STD_LOGIC;
           b      : in   STD_LOGIC;
           c_in   : in   STD_LOGIC;
           s      : out  STD_LOGIC;
           c_out  : out  STD_LOGIC);
end component;

signal c0: STD_LOGIC;
begin
    U1: FullAdder port map (a(0), b(0), c_in, s(0), c0);
    U2: FullAdder port map (a(1), b(1), c0, s(1), c_out);	 
end Structural;

architecture Behavioral of FAx2 is
signal s0, c0: STD_LOGIC;

begin

   s0 <= a(0) xor b(0) xor c_in;
   c0 <= (a(0) and b(0)) or (a(0) and c_in) or (b(0) and c_in);
   s(0) <= s0;
   
   s(1) <= a(1) xor b(1) xor c0;
   c_out <= (a(1) and b(1)) or ((a(1) xor b(1)) and c0);
end Behavioral;

