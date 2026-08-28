-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: SNN: subtype_declaration missing 'is' and subtype_indication - 'subtype t_bad;' has a semicolon directly after the identifier, verifying 'is subtype_indication' is an essential component of subtype_declaration
-- Expected Result: Triggers syntax error: 'is' is expected instead of ';'
-- Dependencies: None
-- =============================================================
entity sub45_ent is end entity;
architecture rtl of sub45_ent is
  subtype t_bad;
begin
end architecture;
