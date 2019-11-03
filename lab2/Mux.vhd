library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           z : out  STD_LOGIC);
end Mux;

architecture Structural of Mux is
component Inv
   Port ( a : in  STD_LOGIC;
          not_a : out  STD_LOGIC);
end component;

component And2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component Or2
   Port ( a : in  STD_LOGIC;
          b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal not_b, a_and_not_b, b_and_s: STD_LOGIC;
begin
   U1: Inv port map (b, not_b);
   U2: And2 port map (a, not_b, a_and_not_b);
   U3: And2 port map (b, s, b_and_s);
   U4: Or2 port map (a_and_not_b, b_and_s, z);
end Structural;
