library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Device11 is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           f : out  STD_LOGIC;
           g : out  STD_LOGIC);
end Device11;

architecture Structural of Device11 is

component Inv
   Port ( a : in  STD_LOGIC;
          not_a : out  STD_LOGIC);
end component;

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

signal xy,
       yz,
		 not_y,
		 not_x,
		 not_x_and_not_y,
		 not_x_and_z: STD_LOGIC;

begin
   U1: And2 port map (x, y, xy);
   U2: And2 port map (y, z, yz);	
	U3: Or2 port map (xy, yz, f);
	
	U4: Inv port map (y, not_y);
	U5: Inv port map (x, not_x);
	
	U6: And2 port map (not_x, not_y, not_x_and_not_y);
   U7: And2 port map (not_x, z, not_x_and_z);	
	U8: Or2 port map (not_x_and_not_y, not_x_and_z, g);
end Structural;

architecture Behavioral of Device11 is
begin	
   f <= (x and y) or (y and z);
   g <= (not x and not y) or (not x and z);
end Behavioral;
