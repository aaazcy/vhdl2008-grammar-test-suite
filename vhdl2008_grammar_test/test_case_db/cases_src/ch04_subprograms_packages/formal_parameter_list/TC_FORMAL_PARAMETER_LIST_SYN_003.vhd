-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Positive
-- Test Focus: formal_parameter_list with a single constant-class parameter without default value: constant x:in integer, verification of a single constant parameter in a minimal parameter list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_single_ent is port(a:in integer; y:out integer); end entity;
architecture bh of fpl_single_ent is
  function f_neg(constant x:in integer) return integer is
  begin return -x; end function;
begin
  y<=f_neg(a);
end architecture bh;
