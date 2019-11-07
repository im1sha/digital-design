library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RsTrigger is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC
           );
end RsTrigger;

architecture Behavioral of RsTrigger is
   signal to_Q, to_nQ, to_s, to_r: STD_LOGIC;
   
begin
   Main : process(S, R, C)
   begin
      if rising_edge(C) then
      
         to_r <= to_s nand (not S);
         to_nQ <= to_r;
         to_s <= to_r nand (not R);
         to_Q <= to_s;
         
      end if;
   end process;
   
   Q <=  to_Q;
   nQ <=  to_nQ;
end Behavioral;
