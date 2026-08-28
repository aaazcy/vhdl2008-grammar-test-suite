-- =============================================================
-- Case ID: TC_SEQUENTIAL_STATEMENT_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SEQUENTIAL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: sequential_statement ::= wait_statement | ... | null_statement
-- Case Type: Positive
-- Test Focus: return_statement as a sequential_statement — returning a value inside a function body, verifying return is a valid sequential_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sqs_syn9_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sqs_syn9_ent is
  function f_double(x:integer) return integer is
  begin
    return x * 2;
  end function;
begin
  y <= f_double(a);
end architecture bh;
