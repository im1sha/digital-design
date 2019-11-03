library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Device7 is
    Port ( w : in  STD_LOGIC;
           x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           g : out  STD_LOGIC);
end Device7;

architecture Structural of Device7 is

component Or2
   Port ( a : in  STD_LOGIC;
	       b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component And2
   Port ( a : in STD_LOGIC;
	       b : in STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component And3
   Port ( a : in STD_LOGIC;
	       b : in STD_LOGIC;
			 c : in STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal wxy,
       yz: STD_LOGIC;

begin
   U1: And3 port map (w, x, y, wxy);
   U2: And2 port map (y, z, yz);	
	U3: Or2 port map (wxy, yz, g);
end Structural;

architecture Behavioral of Device7 is
begin
   g <= (w and x and y) or (y and z);
end Behavioral;
