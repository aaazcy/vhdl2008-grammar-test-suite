-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: pure function_specification with the 2008 parameter keyword: pure function f parameter(...) return ..., verifies the parameter keyword of the function branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ss_param_ent is port(a:in integer; y:out boolean); end entity;
architecture bh of ss_param_ent is
  pure function f_pos parameter(constant x:in integer) return boolean is
  begin return x>0; end function;
begin
  y<=f_pos(a);
end architecture bh;
