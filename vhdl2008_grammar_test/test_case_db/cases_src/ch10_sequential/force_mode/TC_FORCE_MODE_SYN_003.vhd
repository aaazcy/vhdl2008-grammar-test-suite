-- =============================================================
-- Case ID: TC_FORCE_MODE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Positive
-- Test Focus: `in` used in conditional force with when/else -- tests `force in` combined with conditional_expressions on std_logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity fmode_syn_003 is
end entity fmode_syn_003;

architecture test of fmode_syn_003 is
  signal s_sig : std_logic := '0';
  signal s_en  : std_logic := '0';
begin
  process is
  begin
    s_sig <= force in '1' when s_en = '1' else '0';
    wait for 10 ns;
    s_sig <= release in;
    wait;
  end process;
end architecture test;
