library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task_c is
	Port( KEY1_in : in  STD_LOGIC;
         KEY2_in : in  STD_LOGIC;
         KEY3_in : in  STD_LOGIC;
         KEY4_in : in  STD_LOGIC;
         LED1_out : out  STD_LOGIC;
         LED2_out : out  STD_LOGIC);
end task_c;

architecture Behavioral of task_c is
	signal s : STD_LOGIC;
begin
	s <= (KEY1_in AND KEY2_in) 
		OR (KEY3_in AND (NOT KEY2_in) AND KEY4_in);
	LED1_out <= s;
	LED2_out <= NOT s;
end Behavioral;

