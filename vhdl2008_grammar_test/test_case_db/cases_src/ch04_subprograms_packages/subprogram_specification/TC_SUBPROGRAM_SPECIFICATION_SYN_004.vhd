-- =============================================================
-- Case ID: TC_SUBPROGRAM_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_specification ::= procedure_specification | function_specification
-- Case Type: Positive
-- Test Focus: function_specification as subprogram_specification — impure function with parameters and return type, verifies function_specification is the second legal choice branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ss_func_ent is port(a,b:in integer; y:out boolean); end entity;
architecture bh of ss_func_ent is
  function f_gt(x,y:integer) return boolean is
  begin return x>y; end function;
begin
  y<=f_gt(a,b);
end architecture bh;
