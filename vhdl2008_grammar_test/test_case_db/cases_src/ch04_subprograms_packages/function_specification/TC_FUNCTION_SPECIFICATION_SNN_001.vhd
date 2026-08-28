-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: function_specification ::= [ pure | impure ] function designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Negative
-- Test Focus: SNN: missing "function" keyword - only [pure] designator return type_mark appears, so the parser cannot recognize the start of function_specification
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity fs_nofunc_ent is port(y:out integer); end entity;
architecture bh of fs_nofunc_ent is
  -- ERROR: missing 'function' keyword after 'pure'
  pure f_broken return integer is
  begin return 0; end;
begin
  y<=0;
end architecture bh;
