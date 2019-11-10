library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity ShiftRegister is
    Generic ( N : integer := 8);
    Port ( Sin : in  STD_LOGIC;
           SE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Pout : out  STD_LOGIC_VECTOR (0 to N-1));
end ShiftRegister;

architecture Structural of ShiftRegister is
   signal reg: STD_LOGIC_VECTOR ( 0 to N-1 ) := (others => '0');
begin
   U1: FDCE port map (       
       Q => reg(0),
       C => CLK, 
       CE => SE, 
       CLR => RST, 
       D => Sin 
       );
   U2: BUF port map ( I => reg(0), O => Pout(0) );
   U3: for i in 1 to N-1 generate
      U4: FDCE port map ( 
            Q => reg(i), 
            C => CLK, 
            CE => SE, 
            CLR => RST, 
            D => reg(i-1) 
            );
      U5: BUF port map ( I => reg(i), O => Pout(i) );
   end generate;

end Structural;

architecture Behavioral of ShiftRegister is
   signal reg: STD_LOGIC_VECTOR ( 0 to N-1) 
        := (others => '0');
begin
   Main : process ( Sin, SE, CLK, RST )
   begin
      if RST = '1' then
         reg <= ( others => '0' );
      elsif rising_edge(CLK) then
         if SE = '1' then
            reg <= Sin & reg(0 to N-2);
         end if;
      end if;
   end process;
   Pout <= reg;
end Behavioral;
