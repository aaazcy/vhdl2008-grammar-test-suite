-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::= array index_constraint of element_subtype_indication
-- Case Type: Negative
-- Test Focus: SNN: constrained_array_definition missing the 'of' keyword - in 'type bad_arr is array (0 to 7) integer;' the index_constraint and element_subtype_indication lack "of" between them, verifying the BNF requires of to separate the index constraint from the element subtype
-- Expected Result: Triggers syntax error: 'of' is expected instead of "integer"
-- Dependencies: None
-- =============================================================
entity cad8_ent is end entity;
architecture rtl of cad8_ent is
  type bad_arr is array (0 to 7) integer;
begin
end architecture;
