-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Positive
-- Test Focus: Single concurrent assertion as entity_statement — after entity begin there is only one concurrent_assertion (checking the clk period does not exceed 20 ns), verifying one repetition of { entity_statement } (exactly one passive statement) is legal in the entity statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity esp_single_ent is
  port(clk:in bit);
begin
  assert not(clk'event and clk='1' and clk'delayed'last_event<20 ns)
    report "clock period too short" severity warning;
end entity esp_single_ent;
architecture bh of esp_single_ent is
begin end architecture bh;
