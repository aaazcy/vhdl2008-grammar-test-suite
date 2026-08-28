-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SNN_002
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Negative
-- Test Focus: SNN: discrete_range in the index_constraint of array_constraint missing its right bound - in 't_arr(0 to)' the "to" is followed by no bound expression, verifying discrete_range requires complete bounds on both sides
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity arr_ctr_ent is end entity;
architecture rtl of arr_ctr_ent is
  type t_arr is array (natural range <>) of integer;
  subtype t_bad is t_arr(0 to);
begin
end architecture;
