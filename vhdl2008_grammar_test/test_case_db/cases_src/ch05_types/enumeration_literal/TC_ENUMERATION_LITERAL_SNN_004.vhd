-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Negative
-- Test Focus: Syntax error -- empty enumeration definition, no
--            literals provided between the parentheses. An enum
--            type must have at least one enumeration_literal.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity enum_lit_snn_empty_enum is
end entity enum_lit_snn_empty_enum;
architecture rtl of enum_lit_snn_empty_enum is
  type t_bad is ();  -- ERROR: empty enumeration type
begin
end architecture rtl;
