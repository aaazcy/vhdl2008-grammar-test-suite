-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: syntax error -- subtype of undefined base type
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sd_snn_bad_base is end entity;
architecture rtl of sd_snn_bad_base is
  subtype t_bad is nosuchtype range 0 to 7;  -- ERROR: undefined base type
begin end architecture;