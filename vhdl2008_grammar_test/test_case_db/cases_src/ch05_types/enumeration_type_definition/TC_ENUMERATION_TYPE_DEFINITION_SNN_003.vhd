-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Production: enumeration_type_definition ::= ( enumeration_literal { , enumeration_literal } )
-- Case Type: Negative
-- Test Focus: Reserved word 'signal' used as an enumeration_literal -- VHDL reserved words are not valid identifiers and cannot appear as enumeration literals; attempting to use a reserved word triggers a syntax error at the point where a valid identifier or character literal is expected
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_reserved_ent is end entity;
architecture bh of enum_reserved_ent is
  type t_bad is (OK, signal, ERR);  -- ERROR: 'signal' is a reserved word
  signal s : t_bad;
begin
end architecture bh;
