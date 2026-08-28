-- =============================================================
-- Case ID: TC_FORCE_MODE_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Negative
-- Test Focus: `inout` used as force_mode -- tests that the port mode keyword `inout` is not valid as force_mode (only `in` or `out`)
-- Expected Result: Triggers syntax error: invalid force_mode 'inout', expected 'in' or 'out'
-- Dependencies: None
-- =============================================================
entity fmode_snn_003 is
end entity fmode_snn_003;

architecture test of fmode_snn_003 is
  signal s_val : integer := 0;
begin
  process is
  begin
    s_val <= force inout 100;  -- ERROR: 'inout' is not valid force_mode
    wait;
  end process;
end architecture test;
