-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_name ::= prefix ' attribute_designator [ ( expression ) ]
-- Case Type: Negative
-- Test Focus: SNN: missing `'` — `s_val range` lacks the tick separator, verifying that prefix and attribute_designator must be separated by `'`
-- Expected Result: Triggers syntax error: missing tick
-- Dependencies: None
-- =============================================================
entity an_snn2_ent is port(y:out integer); end entity;
architecture bh of an_snn2_ent is signal s_val:integer:=0; begin y<=s_val range; end architecture bh;
