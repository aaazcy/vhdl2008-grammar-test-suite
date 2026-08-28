-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: procedure statement_part with signal_assignment+wait statements: signal assignment inside the procedure body, verifies the use of the wait statement in a procedure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssp_proc_ent is port(a:in integer; y:out integer); end entity;
architecture bh of ssp_proc_ent is
  procedure p_assign(signal inp:in integer; signal outp:out integer) is
  begin
    outp<=inp;
  end procedure;
begin
  p_assign(a,y);
end architecture bh;
