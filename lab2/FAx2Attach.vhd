library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FAx2Attach is
   Port (  a       : in  STD_LOGIC_VECTOR (1 downto 0); -- operand A
           b       : in  STD_LOGIC_VECTOR (1 downto 0); -- operand B
           c_in    : in  STD_LOGIC;
           s_b       : out STD_LOGIC_VECTOR (1 downto 0);
           c_out_b   : out STD_LOGIC;
           s_s       : out STD_LOGIC_VECTOR (1 downto 0);
           c_out_s   : out STD_LOGIC
           );
end FAx2Attach;

architecture Behavioral of FAx2Attach is
	component FAx2 is
			 Port( 
                   a      : in   STD_LOGIC;
                   b      : in   STD_LOGIC;
                   c_in   : in   STD_LOGIC;
                   s      : out  STD_LOGIC;
                   c_out  : out  STD_LOGIC);
	end component;
begin
	U1 : entity work.FAx2(Behavioral) port map(a, b, c_in, s_b, c_out_b);
	U2 : entity work.FAx2(Structural) port map(a, b, c_in, s_s, c_out_s);
end Behavioral; 
