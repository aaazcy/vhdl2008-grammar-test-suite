-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: Static model negative — integer type definition 'range 0 to 1.5' mixes an integer left bound with a real right bound; the two bounds of an integer type range must belong to the same type class
-- Expected Result: Triggers semantic error: left and right bounds must be of the same type class
-- Dependencies: None
-- =============================================================
entity itd_ent is end entity;
architecture rtl of itd_ent is
  type t_bad is range 0 to 1.5;
begin
end architecture;
