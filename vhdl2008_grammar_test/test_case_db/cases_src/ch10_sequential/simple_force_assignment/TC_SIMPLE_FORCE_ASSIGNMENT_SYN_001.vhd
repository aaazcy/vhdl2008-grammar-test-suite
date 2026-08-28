-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Positive
-- Test Focus: Minimal simple force assignment without explicit force_mode, defaulting to in mode
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_force_syn_001 is
end entity simple_force_syn_001;

architecture test of simple_force_syn_001 is
  signal s_data : bit := '0';
begin
  process is
  begin
    s_data <= force '1';
    wait for 10 ns;
    s_data <= release;
    wait;
  end process;
end architecture test;
