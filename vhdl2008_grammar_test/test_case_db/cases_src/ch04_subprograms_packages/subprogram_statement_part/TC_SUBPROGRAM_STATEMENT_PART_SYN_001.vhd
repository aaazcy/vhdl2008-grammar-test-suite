-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: minimal form: single return_statement as the only sequential_statement — the function contains only return 0, verifies the minimal subprogram_statement_part where {statement} repeats once
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssp_min_ent is port(r:out integer); end entity;
architecture bh of ssp_min_ent is
  function f_zero return integer is
  begin return 0; end function;
begin
  r<=f_zero;
end architecture bh;
