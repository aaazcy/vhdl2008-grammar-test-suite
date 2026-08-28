-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Negative
-- Test Focus: procedure specification with invalid mode keyword 'input' instead of 'in' in formal_parameter_list interface_element
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ps_badmode_ent is
  port(result: out integer);
end entity;
architecture bh of ps_badmode_ent is
  -- ERROR: 'input' is not a valid VHDL mode keyword for formal_parameter_list
  procedure p_copy(a: input integer) is
  begin
    result <= a;
  end procedure;
  signal s_val: integer := 42;
begin
  p_copy(s_val);
end architecture bh;
