-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Negative
-- Test Focus: Syntax error -- enumeration literal with invalid character '#' in identifier name
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity enum_lit_snn_hash is end entity;
architecture rtl of enum_lit_snn_hash is
  type t_bad is (IDLE, STA#RT, DONE);  -- ERROR: '#' not allowed in basic identifier
begin end architecture;