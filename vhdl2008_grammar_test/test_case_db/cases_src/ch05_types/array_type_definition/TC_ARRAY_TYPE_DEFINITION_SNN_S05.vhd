-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SNN_S05
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: array_type_definition ::= constrained_array_definition | unbounded_array_definition
-- Case Type: Negative (Production-Specific)
-- Test Focus: constrained_array_definition with inverted range direction syntax — the direction keyword (to/downto) must have bounds on both sides; placing keyword before first bound is invalid
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity atd_e is end entity;
architecture bh of atd_e is
  type t_bad is array(to 0 7) of integer;  -- ERROR: "to" must be between lower and upper bounds
  signal s : t_bad;
begin end architecture;
