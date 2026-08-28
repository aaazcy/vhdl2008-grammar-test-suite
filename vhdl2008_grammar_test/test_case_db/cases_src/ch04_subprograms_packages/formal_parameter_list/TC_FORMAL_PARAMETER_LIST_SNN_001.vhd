-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Negative
-- Test Focus: SNN: missing ";" separator between parameters - procedure p(a:in integer b:in integer), missing semicolon makes multiple parameters unparsable
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity fpl_nosemi_ent is port(r:out integer); end entity;
architecture bh of fpl_nosemi_ent is
  -- ERROR: missing ';' between parameters in formal_parameter_list
  procedure p_bad(a:in integer b:in integer) is
  begin null; end procedure;
begin
  r<=0;
end architecture bh;
