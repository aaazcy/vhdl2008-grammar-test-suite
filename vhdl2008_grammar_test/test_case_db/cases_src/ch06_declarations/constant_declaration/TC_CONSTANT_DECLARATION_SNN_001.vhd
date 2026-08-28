-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.1
-- Production: constant_declaration ::= constant identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Negative
-- Test Focus: ERROR: constant_declaration missing the colon before the subtype_indication.
-- Expected Result: Triggers syntax error (missing colon)
-- Dependencies: None
-- =============================================================
entity constant_decl_snn1 is
end entity constant_decl_snn1;

architecture arch of constant_decl_snn1 is
  constant C_VAL integer := 42;
begin
end architecture arch;
