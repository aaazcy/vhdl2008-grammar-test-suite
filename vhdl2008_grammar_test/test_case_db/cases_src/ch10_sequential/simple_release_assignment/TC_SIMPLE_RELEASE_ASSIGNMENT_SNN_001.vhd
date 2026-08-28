-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Negative
-- Test Focus: Missing the mandatory `release` keyword between `<=` and `;` — parser expects release
-- Expected Result: Triggers syntax error: missing release keyword
-- Dependencies: None
-- =============================================================
entity simple_release_snn_001 is
end entity simple_release_snn_001;

architecture test of simple_release_snn_001 is
  signal s_bad : bit := '0';
begin
  process is
  begin
    s_bad <= force '1';
    wait for 5 ns;
    s_bad <= in;            -- ERROR: missing 'release' keyword
    wait;
  end process;
end architecture test;
