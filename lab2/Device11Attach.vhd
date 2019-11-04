library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Device11Attach is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           f_b: out  STD_LOGIC;
		   f_s: out  STD_LOGIC;
		   g_b: out  STD_LOGIC;
		   g_s: out  STD_LOGIC
		 );
end Device11Attach;

architecture Behavioral of Device11Attach is
	component Device11 is
			 Port ( x : in  STD_LOGIC;
                    y : in  STD_LOGIC;
                    z : in  STD_LOGIC;
                    f : out  STD_LOGIC;
                    g : out  STD_LOGIC
			      );
	end component;
begin
	U1 : entity work.Device11(Behavioral) port map(x, y, z, f_b, g_b);
	U2 : entity work.Device11(Structural) port map(x, y, z, f_s, g_s);
end Behavioral;
