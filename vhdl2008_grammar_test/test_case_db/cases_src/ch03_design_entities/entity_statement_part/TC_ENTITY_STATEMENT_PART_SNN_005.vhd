-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Negative
-- Test Focus: SNN: sequential if statement placed directly in the entity statement part — if condition then is a sequential_statement and must be enclosed in a process to serve as an entity_statement, verifying a bare if statement after entity begin is illegal
-- Expected Result: Triggers syntax error: sequential statement not allowed as entity_statement
-- Dependencies: None
-- =============================================================
entity esp_snn5_ent is
  port(clk:in bit);
begin
  if clk='1' then
    assert true report "clk high" severity note;
  end if;
end entity esp_snn5_ent;
architecture bh of esp_snn5_ent is
begin end architecture bh;
