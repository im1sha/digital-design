library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity DELatch is
    Port ( D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end DELatch;

architecture Behavioral of DELatch is
   signal d_signal : STD_LOGIC;
begin
   Main : process(D, E)
   begin
      if E = '1' then
         d_signal <= D;
      end if;
   end process;
   
   Q <= d_signal;
   nQ <= not d_signal;
end Behavioral;

architecture Structural of DELatch is
component RsLatch
   Port ( S : in  STD_LOGIC;
          R : in  STD_LOGIC;
          nQ : out  STD_LOGIC;
          Q : out  STD_LOGIC);
end component;

signal not_d, se, re : STD_LOGIC;

FOR u4: RsLatch USE ENTITY work.RsLatch(Structural);
begin
   u1: INV port map (I => D, O => not_d);
   u2: AND2 port map (I0 => D, I1 => E, O => se);
   u3: AND2 port map (I0 => not_d, I1 => E, O => re);
   u4: RsLatch port map (S => se, R => re, Q => Q, nQ => nQ);
end Structural;

architecture Delayed of DELatch is
   signal d_signal : STD_LOGIC;
   
   constant transport_delay: time := 1 ns;
   constant inertial_delay: time := 1 ns;
begin
   Main : process(D, E)
   begin
      if E = '1' then
         d_signal <= inertial D after inertial_delay;
      end if;
   end process;
   
   Q <= transport d_signal after transport_delay;
   nQ <= transport not d_signal after transport_delay;
end Delayed;
