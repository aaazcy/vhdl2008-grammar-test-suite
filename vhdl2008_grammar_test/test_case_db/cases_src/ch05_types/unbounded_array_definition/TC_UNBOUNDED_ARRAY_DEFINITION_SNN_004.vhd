-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::= array ( index_subtype_definition { , index_subtype_definition } ) of element_subtype_indication
-- Case Type: Negative
-- Test Focus: SNN: unbounded_array_definition missing the 'of' keyword - in 'array (integer range <>) integer;' the index_subtype_definition and element_subtype_indication lack "of" between them, verifying the BNF requires of to separate the two
-- Expected Result: Triggers syntax error: 'of' is expected instead of "integer"
-- Dependencies: None
-- =============================================================
entity uad_ent is end entity;
architecture rtl of uad_ent is
  type bad_arr is array (integer range <>) integer;
begin
end architecture;
