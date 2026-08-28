-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_body ::= subprogram_specification is subprogram_declarative_part begin subprogram_statement_part end [ subprogram_kind ] [ designator ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "is" keyword - function f_bad return integer begin return 0; end; function_specification loses connection to its body
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sb_nois_ent is port(r:out integer); end entity;
architecture bh of sb_nois_ent is
  -- ERROR: missing 'is' keyword after subprogram_specification
  function f_broken return integer
  begin
    return 0;
  end function;
begin
  r<=0;
end architecture bh;
