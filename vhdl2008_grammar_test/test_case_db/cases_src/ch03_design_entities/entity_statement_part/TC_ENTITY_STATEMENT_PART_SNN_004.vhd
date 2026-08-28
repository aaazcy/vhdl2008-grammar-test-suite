-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Negative
-- Test Focus: SNN: concurrent_assertion missing the severity keyword of the report clause — assert en/='X' report "bad enable" lacks severity <level>, although the severity clause is syntactically optional, what is tested here is the missing semicolon at the end of the assert statement rather than severity
-- Expected Result: Triggers syntax error: missing semicolon after entity_statement
-- Dependencies: None
-- =============================================================
entity esp_snn4_ent is
  port(en:in bit);
begin
  assert en/='X' report "bad enable level"
  assert true report "next" severity note;
end entity esp_snn4_ent;
architecture bh of esp_snn4_ent is
begin end architecture bh;
