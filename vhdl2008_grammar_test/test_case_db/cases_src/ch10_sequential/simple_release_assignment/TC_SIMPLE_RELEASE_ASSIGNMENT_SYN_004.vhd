-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Positive
-- Test Focus: Force/release cycle on an integer signal — release restores the original driver value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_release_syn_004 is
end entity simple_release_syn_004;

architecture test of simple_release_syn_004 is
  signal s_count : integer := 0;
begin
  process is
  begin
    s_count <= force 100;
    wait for 15 ns;
    s_count <= release;
    wait for 15 ns;
    s_count <= force 200;
    wait for 10 ns;
    s_count <= release;
    wait;
  end process;
end architecture test;
