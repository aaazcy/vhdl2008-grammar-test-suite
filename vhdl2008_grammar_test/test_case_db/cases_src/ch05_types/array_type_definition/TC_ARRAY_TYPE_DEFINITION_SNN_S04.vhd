-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SNN_S04
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative (Production-Specific)
-- Test Focus: unbounded_array_definition missing box placeholder in second dimension — the range <> syntax is required for each unbounded dimension; using a plain identifier without a range fails parsing
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity atd_e is end entity;
architecture bh of atd_e is
  type t_bad is array(integer range <>, boolean) of bit;  -- ERROR: second dimension must use range <> or discrete_range, bare type_mark not allowed
  signal s : t_bad;
begin end architecture;
