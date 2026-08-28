-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: entity_declarative_item missing semicolon — in the entity declarative part type t_ok is range 0 to 7 lacks a semicolon separator, so the following constant cannot be parsed as a new entity_declarative_item, verifying each item in the { } sequence must be terminated by a semicolon
-- Expected Result: Triggers syntax error: missing semicolon after entity_declarative_item
-- Dependencies: None
-- =============================================================
entity edp_snn4_ent is
  port(y:out integer);
  type t_ok is range 0 to 7
  constant C_OK:t_ok:=0;
end entity edp_snn4_ent;
architecture bh of edp_snn4_ent is
begin y<=integer(C_OK); end architecture bh;
