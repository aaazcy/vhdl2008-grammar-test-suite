-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: SNN: subtype_declaration referencing an undeclared type_mark - in 'subtype t_bad is no_such_type range 0 to 3;' the type mark no_such_type was never declared, verifying the type_mark of subtype_indication must reference a declared type
-- Expected Result: Triggers semantic error: no declaration for "no_such_type"
-- Dependencies: None
-- =============================================================
entity sub46_ent is end entity;
architecture rtl of sub46_ent is
  subtype t_bad is no_such_type range 0 to 3;
begin
end architecture;
