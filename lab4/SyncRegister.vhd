library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity SyncRegister is
    Generic ( N : integer := 8);
    Port ( Din : in  STD_LOGIC_VECTOR (N-1 downto 0);
           CE : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (N-1 downto 0));
end SyncRegister;

architecture Structural of SyncRegister is
begin
   U1: for i in 0 to N-1 generate
      U2: FDE port map ( D => Din(i), CE => CE, C => C, Q => Dout(i));
   end generate;
end Structural;

architecture Behavioral of SyncRegister is
signal reg : STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
begin
   Main : process ( Din, CE, C )
   begin
      if rising_edge(C) then
         if CE = '1' then
            reg <= Din;
         end if;
      end if;
   end process;
   
   Dout <= reg;
end Behavioral;
