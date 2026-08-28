-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: subprogram_statement_part: wait statement in function — wait is a sequential_statement, but it is ONLY allowed in procedures and processes, NOT in functions; the function f_wait contains 'wait for 1 ns;' and is rejected
-- Expected Result: Triggers semantic error: wait statement not allowed in a function subprogram
-- Dependencies: None
-- =============================================================
entity ssp_wait_ent is port(b:in bit; y:out bit); end entity;
architecture bh of ssp_wait_ent is
  function f_wait(x : bit) return bit is
  begin
    wait for 1 ns;
    return x;
  end function;
begin
  y <= f_wait(b);
end architecture bh;
