-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | ... | null_statement
-- Case Type: Positive
-- Test Focus: procedure_call_statement as a sequential_statement — calling procedure p_swap inside a process to swap variable values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn8_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sqs_syn8_ent is
  procedure p_add(x,y:in integer; z:out integer) is
  begin
    z := x + y;
  end procedure;
begin
  process(a,b) is
    variable v : integer;
  begin
    p_add(a, b, v);
    y <= v;
  end process;
end architecture bh;
