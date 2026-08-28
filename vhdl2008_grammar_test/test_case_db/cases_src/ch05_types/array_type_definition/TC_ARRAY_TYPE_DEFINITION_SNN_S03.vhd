-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SNN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative (Production-Specific)
-- Test Focus: missing "array" keyword in type definition — the reserved word "array" is mandatory in an array_type_definition; omitting it should fail parsing
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity atd_e is end entity;
architecture bh of atd_e is
  type t_bad is (0 to 7) of integer;  -- ERROR: missing "array" keyword
  signal s : t_bad;
begin end architecture;
