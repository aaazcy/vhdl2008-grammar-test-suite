-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: function_specification ::= [ pure | impure ] function designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Positive
-- Test Focus: Minimal form of parameterless pure function: formal_parameter_list omitted, no [parameter] keyword, return integer, verification of function_specification syntax with all optional parts omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fs_noparam_ent is port(y:out integer); end entity;
architecture bh of fs_noparam_ent is
  pure function f_answer return integer is
  begin return 42; end function;
begin
  y<=f_answer;
end architecture bh;
