-- =============================================================
-- Case ID: TC_FORCE_MODE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Positive
-- Test Focus: Both `in` and `out` force_mode used in the same process on different signals -- tests that `force in` and `force out` coexist
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity fmode_syn_006 is
  port (
    o_ext : out std_logic_vector(7 downto 0)
  );
end entity fmode_syn_006;

architecture test of fmode_syn_006 is
  signal s_int : std_logic_vector(7 downto 0) := "00000000";
begin
  process is
  begin
    s_int <= force in "10101010";
    o_ext <= force out "01010101";
    wait for 10 ns;
    s_int <= release in;
    o_ext <= release out;
    wait;
  end process;
end architecture test;
