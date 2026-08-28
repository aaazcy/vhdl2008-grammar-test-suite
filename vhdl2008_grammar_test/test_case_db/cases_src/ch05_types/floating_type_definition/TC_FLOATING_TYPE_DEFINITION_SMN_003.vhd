-- =============================================================
-- Case ID: TC_FLOATING_TYPE_DEFINITION_SMN_003
-- Rule Type: Static Model
-- Related Rule ID: BNF_FLOATING_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: floating_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: Static model negative — floating type definition 'range 0 to 10.0' mixes an integer left bound with a real right bound; the two bounds of a floating type range must belong to the same type class
-- Expected Result: Triggers semantic error: left and right bounds must be of the same type class
-- Dependencies: None
-- =============================================================
entity fl22_ent is end entity;
architecture rtl of fl22_ent is
  type t_bad is range 0 to 10.0;
begin
end architecture;
