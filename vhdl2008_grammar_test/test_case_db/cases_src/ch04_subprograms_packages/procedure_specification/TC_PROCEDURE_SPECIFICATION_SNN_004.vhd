-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Negative
-- Test Focus: procedure specification with missing semicolon separator between two interface elements in formal_parameter_list breaking the { ; interface_element } repetition rule
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ps_nosemi_ent is
  port(x: out integer);
end entity;
architecture bh of ps_nosemi_ent is
  -- ERROR: missing ';' between formal parameters 'a' and 'b' in formal_parameter_list
  procedure p_combine(a: in integer b: in integer) is
  begin
    x <= a + b;
  end procedure;
begin
  p_combine(3, 4);
end architecture bh;
