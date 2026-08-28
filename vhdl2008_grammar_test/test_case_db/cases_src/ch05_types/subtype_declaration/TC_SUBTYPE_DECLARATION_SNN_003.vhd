-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: syntax error -- subtype declaration with missing 'is' keyword
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sd_snn_no_is is end entity;
architecture rtl of sd_snn_no_is is
  subtype t_bad integer range 0 to 7;  -- ERROR: missing 'is'
begin end architecture;