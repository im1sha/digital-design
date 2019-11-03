library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4x2 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           a1 : in  STD_LOGIC;
           b1 : in  STD_LOGIC;
           s : in  STD_LOGIC;
           z : out  STD_LOGIC;
           z1 : out  STD_LOGIC);
end Mux4x2;

architecture Structural of Mux4x2 is
component Mux
       Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s : in  STD_LOGIC;
           z : out  STD_LOGIC);
end component;

begin
    U1: Mux port map (a, b, s, z);
    U2: Mux port map (a1, b1, s, z1);
end Structural;