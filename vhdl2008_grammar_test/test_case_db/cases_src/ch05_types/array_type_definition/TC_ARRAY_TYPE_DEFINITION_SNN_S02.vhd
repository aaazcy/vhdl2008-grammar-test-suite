-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SNN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative (Production-Specific)
-- Test Focus: constrained_array_definition with wrong constraint delimiter — using semicolon instead of proper discrete_range syntax between index dimensions
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity atd_e is end entity;
architecture bh of atd_e is
  type t_bad is array(0 to 7; 0 to 3) of integer;  -- ERROR: semicolon is invalid delimiter; must use comma
  signal s : t_bad;
begin end architecture;
