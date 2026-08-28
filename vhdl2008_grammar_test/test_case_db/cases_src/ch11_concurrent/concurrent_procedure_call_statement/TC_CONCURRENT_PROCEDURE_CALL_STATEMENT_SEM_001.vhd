-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Rule Description: A concurrent procedure call statement is equivalent to a process containing only the procedure call, with a sensitivity list consisting of all signals that are actuals to in or inout mode parameters of the procedure
-- Case Type: Positive
-- Test Focus: a concurrent procedure call is equivalent to a process — when the procedure parameter is an in mode signal, the procedure re-executes automatically whenever the actual signal changes, verifying the process-equivalent semantics of a concurrent procedure call
-- Expected Result: Compiles successfully; procedure re-executes on signal changes
-- Dependencies: None
-- =============================================================
entity cpc_sem1_ent is
  port(a, b : in bit; sum, carry : out bit);
end entity cpc_sem1_ent;
architecture bh of cpc_sem1_ent is
  procedure full_adder(
    signal x, y : in bit;
    signal s, c : out bit) is
  begin
    s <= x xor y;
    c <= x and y;
  end procedure full_adder;
begin
  full_adder(a, b, sum, carry);
end architecture bh;
