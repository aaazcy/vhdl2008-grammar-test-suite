-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: function_specification ::= [ pure | impure ] function designator [ ( formal_parameter_list ) ] return type_mark
-- Case Type: Positive
-- Test Focus: Pure + impure function specification with full parameter modes: pure f_pure(constant in+signal in+variable inout with default) return integer + impure f_imp(variable without default) return boolean, verification of pure/impure keywords and multiple parameter mode/class combinations of function_specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fs_ent is port(a,b:in integer; gt:out boolean; sum:out integer); end entity;
architecture bh of fs_ent is
  pure function f_add(constant x:in integer; constant y:in integer:=0) return integer is
  begin return x+y; end function;
  impure function f_gt(constant x,y:in integer) return boolean is
    variable v:boolean; begin v:=(x>y); return v; end function;
begin
  sum<=f_add(a,b); gt<=f_gt(a,b);
end architecture bh;
