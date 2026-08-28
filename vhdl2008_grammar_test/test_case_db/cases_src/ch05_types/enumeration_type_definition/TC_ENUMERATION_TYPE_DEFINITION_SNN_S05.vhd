-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SNN_S05
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Integer numeric literal used where an enumeration_literal (identifier or character_literal) is required -- the BNF allows only identifiers and character_literals as enumeration_literal forms; an integer literal such as 0 does not match either production, triggering a syntax error at the integer token
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_intlit_ent is end entity;
architecture bh of enum_intlit_ent is
  type t_bad is (0, 1, 2, 3);  -- ERROR: integer literal is not an enumeration_literal
  signal s : t_bad;
begin
end architecture bh;
