-- =============================================================
-- Case ID: TC_FORCE_MODE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Positive
-- Test Focus: `in` used in simple force assignment -- tests basic `force in` on an integer signal in a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fmode_syn_001 is
end entity fmode_syn_001;

architecture test of fmode_syn_001 is
  signal s_val : integer := 0;
begin
  process is
  begin
    s_val <= force in 100;
    wait for 10 ns;
    s_val <= release in;
    wait;
  end process;
end architecture test;
