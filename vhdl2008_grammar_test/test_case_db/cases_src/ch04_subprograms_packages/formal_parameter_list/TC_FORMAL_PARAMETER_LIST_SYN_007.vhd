-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Positive
-- Test Focus: formal_parameter_list with multiple parameters with default value combinations: x:in integer:=0; y:in integer:=1, verification of comma-separated syntax of multiple default-value parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_default_ent is port(a:in integer; y:out integer); end entity;
architecture bh of fpl_default_ent is
  function f_sum(x:integer:=0; y:integer:=0; z:integer:=0) return integer is
  begin return x+y+z; end function;
begin
  y<=f_sum(a,1);
end architecture bh;
