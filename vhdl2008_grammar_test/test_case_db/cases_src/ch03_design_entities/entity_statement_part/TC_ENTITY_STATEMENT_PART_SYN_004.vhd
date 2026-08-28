-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Positive
-- Test Focus: Two concurrent_assertions as entity_statement — the entity statement part contains assert (mutual exclusion check of rst and en) and postponed assert (clk_stable check), verifying multiple entity_statements of the same type can be placed consecutively in the entity statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity esp_twoassert_ent is
  port(clk,rst,en:in bit);
begin
  assert not(rst='0' and en='1')
    report "reset active with enable high" severity error;
  postponed assert clk'stable(500 ps)
    report "clock jitter detected" severity warning;
end entity esp_twoassert_ent;
architecture bh of esp_twoassert_ent is
begin end architecture bh;
