-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Negative
-- Test Focus: procedure specification with missing type for a formal parameter in formal_parameter_list (interface_element incomplete, missing subtype_indication)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ps_notype_ent is
  port(q: out integer);
end entity;
architecture bh of ps_notype_ent is
  -- ERROR: parameter 'a' missing type specification after mode 'in'
  procedure p_calc(a: in) is
  begin
    q <= 0;
  end procedure;
begin
  p_calc(5);
end architecture bh;
