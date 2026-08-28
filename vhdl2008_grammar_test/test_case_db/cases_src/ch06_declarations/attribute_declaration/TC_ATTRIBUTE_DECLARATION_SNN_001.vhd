-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: attribute_declaration ::= attribute identifier : type_mark ;
-- Case Type: Negative
-- Test Focus: ERROR: attribute_declaration uses keyword "attr" instead of "attribute". The BNF requires the full keyword.
-- Expected Result: Triggers syntax error (incorrect keyword)
-- Dependencies: None
-- =============================================================
entity attribute_decl_snn1 is
end entity attribute_decl_snn1;

architecture arch of attribute_decl_snn1 is
  attr max_load : integer;
begin
end architecture arch;
