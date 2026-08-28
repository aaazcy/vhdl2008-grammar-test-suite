-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_name ::= prefix ' attribute_designator [ ( expression ) ]
-- Case Type: Negative
-- Test Focus: SNN: missing attribute_designator — `s_val' ;` has no identifier after the tick
-- Expected Result: Triggers syntax error: missing attribute designator
-- Dependencies: None
-- =============================================================
entity an_snn3_ent is port(y:out integer); end entity;
architecture bh of an_snn3_ent is signal s_val:integer:=0; begin y<=s_val'; end architecture bh;
