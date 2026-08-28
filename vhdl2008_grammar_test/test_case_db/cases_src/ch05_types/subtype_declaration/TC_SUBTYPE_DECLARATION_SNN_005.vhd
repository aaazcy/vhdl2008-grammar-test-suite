-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Negative
-- Test Focus: syntax error -- subtype constraint wider than base type
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity sd_snn_wider is end entity;
architecture rtl of sd_snn_wider is
  subtype t_nibble is integer range 0 to 15;
  subtype t_bad is t_nibble range 0 to 255;  -- ERROR: wider than base constraint
begin end architecture;