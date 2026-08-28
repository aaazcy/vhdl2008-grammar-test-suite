-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: subprogram_statement_part: signal assignment with non-signal target — the statement 'v <= '1';' inside function f_test applies the signal assignment operator <= to the variable v, but the target of a signal assignment must be a signal
-- Expected Result: Triggers semantic error: target (variable "v") is not a signal
-- Dependencies: None
-- =============================================================
entity ssp_ent is port(y:out bit); end entity;
architecture bh of ssp_ent is
  function f_test return bit is
    variable v : bit;
  begin
    v <= '1';
    return '1';
  end function;
begin
  y <= f_test;
end architecture bh;
