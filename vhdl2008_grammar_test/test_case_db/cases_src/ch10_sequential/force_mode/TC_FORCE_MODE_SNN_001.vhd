-- =============================================================
-- Case ID: TC_FORCE_MODE_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_MODE
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_mode ::= in | out
-- Case Type: Negative
-- Test Focus: `input` used instead of valid `in` as force_mode -- tests that the full word `input` is rejected as force_mode keyword
-- Expected Result: Triggers syntax error: invalid force_mode 'input', expected 'in' or 'out'
-- Dependencies: None
-- =============================================================
entity fmode_snn_001 is
end entity fmode_snn_001;

architecture test of fmode_snn_001 is
  signal s_val : integer := 0;
begin
  process is
  begin
    s_val <= force input 42;  -- ERROR: 'input' is not valid force_mode
    wait;
  end process;
end architecture test;
