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
   signal rs, rs_nor_s: STD_LOGIC;
begin
   rs_nor_s <= rs nor S;
   nQ <= rs_nor_s;
   rs <= rs_nor_s nor R;
   Q <= rs;
end Behavioral;

architecture Structural of RsLatch is
   signal rs, rs_nor_s: STD_LOGIC;
begin
   RS1: NOR2 port map (I0 => rs, I1 => S, O => rs_nor_s);
   RS2: BUF port map (I => rs_nor_s, O => nq);
   RS3: NOR2 port map (I0 => rs_nor_s, I1 => R, O => rs);
   RS4: BUF port map (I => rs, O => Q);
end Structural;

architecture Delayed of RsLatch is
   signal rs, rs_nor_s: STD_LOGIC;
   constant transport_delay: time := 1 ns;
   constant inertial_delay: time := 1 ns;
begin
   rs_nor_s <= inertial rs nor S after inertial_delay;
   rs <= inertial rs_nor_s nor R after inertial_delay;
   nQ <= transport rs_nor_s after transport_delay;
   Q <= transport rs after transport_delay;
end Delayed;
