-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Positive
-- Test Focus: Simple force assignment targeting an integer signal with a computed arithmetic expression on the RHS
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_force_syn_004 is
end entity simple_force_syn_004;

architecture test of simple_force_syn_004 is
  signal s_count : integer := 0;
  signal s_base  : integer := 10;
begin
  process is
  begin
    s_count <= force s_base * 3 + 7;
    wait for 15 ns;
    s_count <= release;
    wait;
  end process;
end architecture test;
