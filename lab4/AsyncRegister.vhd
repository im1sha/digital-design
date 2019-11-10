library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity AsyncRegister is
    Generic ( N : integer := 8);
    Port ( Din : in  STD_LOGIC_VECTOR (N-1 downto 0);
           CE : in  STD_LOGIC;
           Dout : out  STD_LOGIC_VECTOR (N-1 downto 0));
end AsyncRegister;

architecture Structural of AsyncRegister is
begin
   U1: for i in 0 to N-1 generate
      U2: LD port map ( D => Din(i), G => CE, Q => Dout(i));
   end generate;
end Structural;

architecture Behavioral of AsyncRegister is
signal reg : STD_LOGIC_VECTOR (N-1 downto 0) := (others => '0');
begin
   Main : process ( Din, CE )
   begin
      if CE = '1' then
         reg <= Din;
      end if;
   end process;
   
   Dout <= reg;
end Behavioral;
