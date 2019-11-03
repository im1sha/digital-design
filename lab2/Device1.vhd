library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Device1 is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           f : out  STD_LOGIC);
end Device1;

architecture Structural of Device1 is
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

signal not_x,
       not_y, 
		 not_z,
       x_or_not_y, 
		 up_result, 
		 down_result: STD_LOGIC;

begin
   U1: Inv port map (y, not_y);
   U2: Or2 port map (x, not_y, x_or_not_y);
   U3: And2 port map (x_or_not_y, z, up_result);
	
	U4: Inv port map (x, not_x);
   U5: Inv port map (z, not_z);
	U6: And3 port map (not_x, y, not_z, down_result);
	
	U7: Or2 port map (up_result, down_result, f);

end Structural;

architecture Behavioral of Device1 is
begin
   f <= ((x or (not y))and z) or 
	    ((not x) and (not y) and (not z));
end Behavioral;
