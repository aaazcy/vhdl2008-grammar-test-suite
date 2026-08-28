-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Negative
-- Test Focus: SNN: unclosed parenthesis - procedure p(a:in integer missing ), leaving formal_parameter_list without a closing parenthesis, parser expects closure
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity fpl_unclosed_ent is port(r:out integer); end entity;
architecture bh of fpl_unclosed_ent is
  -- ERROR: missing closing ')' in formal_parameter_list
  procedure p_bad(signal a:in integer; signal b:out integer is
  begin null; end procedure;
begin
  r<=0;
end architecture bh;
