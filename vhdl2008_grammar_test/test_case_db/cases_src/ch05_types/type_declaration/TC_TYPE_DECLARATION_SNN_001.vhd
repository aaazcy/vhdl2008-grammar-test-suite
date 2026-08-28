-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: SNN: type_declaration missing the type_definition - in 'type t_bad is;' there is no type definition body after 'is' (neither a full type definition nor a legal incomplete type definition form), verifying full_type_declaration requires a type_definition
-- Expected Result: Triggers syntax error: missing type definition after 'is'
-- Dependencies: None
-- =============================================================
entity td48_ent is end entity;
architecture rtl of td48_ent is
  type t_bad is;
begin
end architecture;
