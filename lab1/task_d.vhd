library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task_d is
	Port( KEY11_in : in  STD_LOGIC;
         KEY12_in : in  STD_LOGIC;
         KEY21_in : in  STD_LOGIC;
         KEY22_in : in  STD_LOGIC;
			KEY_SELECT : in STD_LOGIC;
         LED1_out : out  STD_LOGIC;
         LED2_out : out  STD_LOGIC
			);
end task_d;

architecture Behavioral of task_d is
begin
	LED1_out <= KEY11_in when KEY_SELECT = '0' else KEY12_in;
	LED2_out <= KEY21_in when KEY_SELECT = '0' else KEY22_in;
end Behavioral;

