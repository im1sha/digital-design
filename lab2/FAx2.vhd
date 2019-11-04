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


architecture Behavioral of FAx2 is
signal a0_xor_b0,
       s0,
       up_and0,
       down_and0,
       c0,
       a1_xor_b1,
       s1,
       up_and1,
       down_and1: std_logic;

begin
     a0_xor_b0 <= a(0) xor b(0);
     s0 <= a0_xor_b0 xor c_in;
     up_and0 <= c_in and a0_xor_b0;
     down_and0 <= a(0) and b(0);
     
     c0 <= up_and0 or down_and0;

     a1_xor_b1 <= a(1) xor b(1);
     s1 <= a1_xor_b1 xor c0;
     up_and1 <= c0 and a1_xor_b1;
     down_and1 <= a(1) and b(1);

     c_out <= up_and1 or down_and1;
     
     s(0) <= s0;
     s(1) <= s1;  
     
end Behavioral;


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
