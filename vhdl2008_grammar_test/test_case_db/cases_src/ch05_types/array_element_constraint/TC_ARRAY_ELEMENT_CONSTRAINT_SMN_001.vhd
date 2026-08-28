-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Negative
-- Test Focus: Static model negative: the array element range constraint '0 to 15.5' uses a real right bound 15.5 although the element base type is integer, so the element constraint cannot be applied to the element subtype
-- Expected Result: Triggers semantic error: can't match floating point literal with type integer
-- Dependencies: None
-- =============================================================
entity aec_ent is end entity;
architecture rtl of aec_ent is
  type bad_arr is array (0 to 3) of integer range 0 to 15.5;
begin
end architecture;
