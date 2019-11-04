library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Device1Attach is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           f_b: out  STD_LOGIC;
		   f_s: out  STD_LOGIC);
end Device1Attach;

architecture Behavioral of Device1Attach is
	component Device1 is
			 Port ( x : in  STD_LOGIC;
                    y : in  STD_LOGIC;
                    z : in  STD_LOGIC;
                    f : out  STD_LOGIC);
	end component;
begin
	U1 : entity work.Device1(Behavioral) port map(x, y, z, f_b);
	U2 : entity work.Device1(Structural) port map(x, y, z, f_s);
end Behavioral;
