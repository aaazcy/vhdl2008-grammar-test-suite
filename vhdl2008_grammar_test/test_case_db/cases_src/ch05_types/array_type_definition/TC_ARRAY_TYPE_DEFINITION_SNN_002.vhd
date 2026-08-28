-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative
-- Test Focus: constrained_array_definition with non-discrete index type (real) — violates the requirement that index subtypes must be discrete
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity array_type_defi_e2 is end entity;
architecture bh of array_type_defi_e2 is
  -- ERROR: real is not a discrete type, cannot serve as array index
  type t_bad is array(real range 0.0 to 1.0) of integer;
  signal s : t_bad;
begin end architecture bh;
