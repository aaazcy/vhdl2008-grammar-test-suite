-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative
-- Test Focus: constrained_array_definition missing element type — array(index_range) requires an element subtype indication after "of"
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity array_type_defi_e3 is end entity;
architecture bh of array_type_defi_e3 is
  -- ERROR: missing element type after "of" keyword
  type t_bad is array(0 to 7);
  signal s : t_bad;
begin end architecture bh;
