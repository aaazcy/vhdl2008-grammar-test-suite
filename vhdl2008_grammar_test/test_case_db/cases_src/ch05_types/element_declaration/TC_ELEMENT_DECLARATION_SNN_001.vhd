-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::= identifier_list : element_subtype_definition ;
-- Case Type: Negative
-- Test Focus: SNN: element_declaration missing the identifier - the record element declaration has no identifier list before the colon, verifying identifier_list is an essential component of element_declaration
-- Expected Result: Triggers syntax error: an identifier is expected instead of ':'
-- Dependencies: None
-- =============================================================
entity el16_ent is end entity;
architecture rtl of el16_ent is
  type t_rec is record
    : integer;
  end record;
begin
end architecture;
