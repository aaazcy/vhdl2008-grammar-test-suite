-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: entity_declarative_item appearing after begin — the signal s_late:bit declaration in the entity appears after the begin keyword (entity_statement_part region), entity_declarative_part must come before begin, verifying begin is the impassable boundary between the declarative part and the statement part
-- Expected Result: Triggers syntax error: declaration not allowed in entity statement part
-- Dependencies: None
-- =============================================================
entity edp_snn6_ent is
  port(y:out bit);
begin
  signal s_late:bit;
end entity edp_snn6_ent;
architecture bh of edp_snn6_ent is
begin y<=s_late; end architecture bh;
