-- =============================================================
-- Case ID: TC_SIMPLE_FORCE_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_force_assignment ::= target <= force [ force_mode ] expression ;
-- Case Type: Positive
-- Test Focus: Simple force assignment inside a procedure body, testing force in subprogram context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity simple_force_syn_006 is
end entity simple_force_syn_006;

architecture test of simple_force_syn_006 is
  signal s_val : integer := 0;

  procedure force_value(signal tgt : out integer; val : integer) is
  begin
    tgt <= force val;
  end procedure;
begin
  process is
  begin
    force_value(s_val, 42);
    wait for 10 ns;
    s_val <= release;
    wait;
  end process;
end architecture test;
