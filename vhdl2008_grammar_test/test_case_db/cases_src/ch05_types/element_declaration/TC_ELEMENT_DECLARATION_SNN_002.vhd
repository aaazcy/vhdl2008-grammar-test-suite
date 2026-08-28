-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Negative
-- Test Focus: SNN: element_declaration missing the colon and subtype_definition - the record element declaration has the identifier directly followed by a semicolon, missing ':' and element_subtype_definition, verifying both are mandatory
-- Expected Result: Triggers syntax error: ':' is expected instead of ';'
-- Dependencies: None
-- =============================================================
entity el17_ent is end entity;
architecture rtl of el17_ent is
  type t_rec is record
    f_a;
  end record;
begin
end architecture;
