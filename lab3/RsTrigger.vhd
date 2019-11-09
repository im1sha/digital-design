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
   signal q_s, nq_s: STD_LOGIC;
   
begin
   Main : process(S, R, C)
   begin
      if rising_edge(C) and ((S or R) ='1') 
      then
        if S /= q_s then 
           q_s <= S;
        end if;
        if R /= nq_s then
           nq_s <= R;
        end if;               
      end if;   
   end process;

   Q <=  q_s;
   nQ <= nq_s;
    
end Behavioral;
