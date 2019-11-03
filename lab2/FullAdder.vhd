library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port ( 
	        a      : in  STD_LOGIC;
           b      : in  STD_LOGIC;
           c_in   : in  STD_LOGIC;
           s      : out  STD_LOGIC;
           c_out  : out  STD_LOGIC			  
			  );
end FullAdder;

architecture Structural of FullAdder is

component Or2
   Port ( a : in  STD_LOGIC;
	       b : in  STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component Xor2
   Port ( a : in STD_LOGIC;
	       b : in STD_LOGIC;
          z : out  STD_LOGIC);
end component;

component And2
   Port ( a : in STD_LOGIC;
	       b : in STD_LOGIC;
          z : out  STD_LOGIC);
end component;

signal a_xor_b,
       a_xor_b_and_c, 
		 a_and_b : STD_LOGIC;

begin
   U1: Xor2 port map (a, b, a_xor_b);
   U2: And2 port map (a_xor_b, c_in, a_xor_b_and_c);
   U3: And2 port map (a, b, a_and_b);

	U4: Xor2 port map (a_xor_b, c_in, s);
	U5: Or2  port map (a_xor_b_and_c, a_and_b, c_out);
end Structural;

