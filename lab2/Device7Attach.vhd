library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Device7Attach is
    Port ( w : in  STD_LOGIC;
	        x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           g_b: out  STD_LOGIC;
			  g_s: out  STD_LOGIC);
end Device7Attach;

architecture Behavioral of Device7Attach is
	component Device7 is
			 Port (  w : in  STD_LOGIC;
			  x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           g : out  STD_LOGIC);
	end component;
begin
	U1 : entity work.Device7(Behavioral) port map(w, x, y, z, g_b);
	U2 : entity work.Device7(Structural) port map(w, x, y, z, g_s);
end Behavioral;
