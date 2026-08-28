-- =============================================================
-- Case ID: TC_FORCE_MODE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Positive
-- Test Focus: `out` used in release statement -- tests `release out` on an output port after force out
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity fmode_syn_004 is
  port (
    o_vec : out std_logic_vector(3 downto 0)
  );
end entity fmode_syn_004;

architecture test of fmode_syn_004 is
begin
  process is
  begin
    o_vec <= force out "1111";
    wait for 10 ns;
    o_vec <= release out;
    wait;
  end process;
end architecture test;
