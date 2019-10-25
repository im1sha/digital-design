library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task_b is
	Port( KEY1_in : in  STD_LOGIC;
         KEY2_in : in  STD_LOGIC;
         KEY3_in : in  STD_LOGIC;
         KEY4_in : in  STD_LOGIC;
         LED1_out : out  STD_LOGIC);
end task_b;

architecture Behavioral of task_b is
begin
	LED1_out <= (KEY1_in AND KEY2_in) 
		OR (KEY3_in AND (NOT KEY2_in) AND KEY4_in);
end Behavioral;

