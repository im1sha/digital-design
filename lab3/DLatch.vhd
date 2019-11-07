library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity DLatch is
    Port ( D : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           nQ : out  STD_LOGIC);
end DLatch;

architecture Behavioral of DLatch is
   signal d_signal : STD_LOGIC;
begin
   Main : process (D)
   begin
      d_signal <= D;
   end process;

   Q <= d_signal;
   nQ <= not d_signal;
end Behavioral;


architecture Structural of DLatch is

component RsLatch
   Port ( S : in  STD_LOGIC;
          R : in  STD_LOGIC;
          nQ : out  STD_LOGIC;
          Q : out  STD_LOGIC);
end component;

signal not_d : STD_LOGIC;

FOR U2: RsLatch USE ENTITY work.RsLatch(Structural);
begin
   U1: INV port map (I => D, O => not_d);
   U2: RsLatch port map (S => D, R => not_d, nQ => nQ, Q => Q);
end Structural;

architecture Delayed of DLatch is
   signal d_signal : STD_LOGIC;
   
   constant transport_delay: time := 1 ns;
   constant inertial_delay: time := 1 ns;
begin
   Main : process (D)
   begin
      d_signal <= inertial D after inertial_delay;
   end process;

   Q <= transport d_signal after transport_delay;
   nQ <= transport not d_signal after transport_delay;
end Delayed;
