-- =============================================================
-- Case ID: TC_SIMPLE_RELEASE_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_RELEASE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_release_assignment ::= target <= release [ force_mode ] ;
-- Case Type: Positive
-- Test Focus: Release statement issued from within a procedure body — tests release in subprogram context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_release_syn_006 is
end entity simple_release_syn_006;

architecture test of simple_release_syn_006 is
  signal s_val : integer := 0;

  procedure release_signal(signal tgt : out integer) is
  begin
    tgt <= release;
  end procedure;
begin
  process is
  begin
    s_val <= force 99;
    wait for 10 ns;
    release_signal(s_val);
    wait;
  end process;
end architecture test;
