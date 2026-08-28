-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_body ::= subprogram_specification is subprogram_declarative_part begin subprogram_statement_part end [ subprogram_kind ] [ designator ] ;
-- Case Type: Negative
-- Test Focus: subprogram_body: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity subprogram_body_e2 is end entity;
architecture bh of subprogram_body_e2 is
  -- ERROR: invalid syntax in subprogram_body
  signal s : bit;
begin
  s <= '1'
end architecture bh;