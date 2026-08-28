-- =============================================================
-- Case ID: TC_FORCE_MODE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Positive
-- Test Focus: `in` used with selected force assignment -- tests `force in` inside `with expr select target <= force in` form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity fmode_syn_005 is
end entity fmode_syn_005;

architecture test of fmode_syn_005 is
  signal s_sel    : integer range 0 to 2 := 0;
  signal s_target : std_logic := '0';
begin
  process is
  begin
    with s_sel select s_target <= force in
      '1' when 0,
      '0' when 1,
      'Z' when others;
    wait for 10 ns;
    s_target <= release in;
    wait;
  end process;
end architecture test;
