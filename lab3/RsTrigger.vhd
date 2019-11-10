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
   signal q_s: STD_LOGIC;
   
begin
   Main : process(S, R, C)
   begin
      if rising_edge(C)
      then
        if S = '1' then 
           q_s <= '1';
        end if;
        if R = '1' then
           q_s <= '0';
        end if;               
      end if;   
   end process;

   Q <=  q_s;
   nQ <= not q_s;
    
end Behavioral;
