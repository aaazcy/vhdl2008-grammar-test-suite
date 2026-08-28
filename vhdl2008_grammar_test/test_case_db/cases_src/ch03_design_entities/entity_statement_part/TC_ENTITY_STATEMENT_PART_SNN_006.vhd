-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Negative
-- Test Focus: SNN: syntax error in the condition expression of concurrent_assertion — assert rst='0 lacks the closing single quote, making the character literal incomplete, the parser detects a lexical error in the condition of entity_statement
-- Expected Result: Triggers syntax error: unterminated character literal in entity_statement
-- Dependencies: None
-- =============================================================
entity esp_snn6_ent is
  port(rst:in bit);
begin
  assert rst='0
    report "reset active" severity note;
end entity esp_snn6_ent;
architecture bh of esp_snn6_ent is
begin end architecture bh;
