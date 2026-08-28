-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ESP_004
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: identifiers referenced by concurrent assertions in entity_statement_part must be declared
-- Case Type: Negative
-- Error Category: undeclared_identifier_error
-- Test Focus: Negative example: the condition expression of a concurrent_assertion in the entity statement part references undeclared_temp, which is neither an entity port nor a declaration item of entity_declarative_part, verifying name resolution in the entity statement part is limited to entity-level declarations and ports
-- Expected Result: Triggers semantic error: identifier undeclared_temp not declared in entity scope
-- Dependencies: None
-- =============================================================
entity esp_smn2_ent is
  port(clk:in bit);
begin
  assert undeclared_temp='1'
    report "bad temp" severity note;
end entity esp_smn2_ent;
architecture bh of esp_smn2_ent is
begin end architecture bh;
