-- =============================================================
-- Case ID: TC_SUBPROGRAM_STATEMENT_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_statement_part ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: SNN: declaration appears inside statement_part — a variable declaration appears after begin of the function body, declarations are only allowed in declarative_part
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ssp_bad_ent is port(r:out integer); end entity;
architecture bh of ssp_bad_ent is
  function f_broken return integer is
  begin
    variable v:integer:=0; -- ERROR: declaration in statement_part, only statements allowed
    return 0;
  end function;
begin
  r<=0;
end architecture bh;
