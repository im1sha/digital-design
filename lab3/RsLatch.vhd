library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity RsLatch is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           nQ : out  STD_LOGIC;
           Q : out  STD_LOGIC);
end RsLatch;

architecture Behavioral of RsLatch is
   signal to_s, to_r: STD_LOGIC;
begin
   to_r <= to_s nor S;
   nQ <= to_r;
   to_s <= to_r nor R;
   Q <= to_s;
end Behavioral;

architecture Structural of RsLatch is
   signal to_s, to_r: STD_LOGIC;
begin
   RS1: NOR2 port map (I0 => to_s, I1 => S, O => to_r);
   RS2: BUF port map (I => to_r, O => nq);
   RS3: NOR2 port map (I0 => to_r, I1 => R, O => to_s);
   RS4: BUF port map (I => to_s, O => Q);
end Structural;

architecture Delayed of RsLatch is
   signal to_s, to_r: STD_LOGIC;
   constant transport_delay: time := 1 ns;
   constant inertial_delay: time := 1 ns;
begin
   to_r <= inertial to_s nor S after inertial_delay;
   to_s <= inertial to_r nor R after inertial_delay;
   nQ <= transport to_r after transport_delay;
   Q <= transport to_s after transport_delay;
end Delayed;
