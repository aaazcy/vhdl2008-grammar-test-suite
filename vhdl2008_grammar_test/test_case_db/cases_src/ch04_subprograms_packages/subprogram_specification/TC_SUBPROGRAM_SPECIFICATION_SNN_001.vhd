-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Negative
-- Test Focus: SNN: subprogram_specification starting with a keyword that is neither procedure nor function — uses an undefined bare designator, exposing the alternative-choice failure
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ss_bad_ent is port(r:out integer); end entity;
architecture bh of ss_bad_ent is
  -- ERROR: bare identifier without procedure/function keyword, not a valid subprogram_specification
  broken_spec return integer is
  begin return 0; end;
begin
  r<=0;
end architecture bh;
