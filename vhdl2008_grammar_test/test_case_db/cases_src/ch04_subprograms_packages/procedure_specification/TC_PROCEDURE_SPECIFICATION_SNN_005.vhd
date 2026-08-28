-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Negative
-- Test Focus: procedure specification with missing designator after 'procedure' keyword; formal_parameter_list opens directly after procedure token with no identifier
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ps_nodesig_ent is
  port(y: out integer);
end entity;
architecture bh of ps_nodesig_ent is
  -- ERROR: missing designator identifier after 'procedure' keyword
  procedure (v: in integer) is
  begin
    y <= v;
  end procedure;
  signal s_val: integer := 10;
begin
  null;
end architecture bh;
