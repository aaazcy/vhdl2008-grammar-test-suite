-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Positive
-- Test Focus: Entity statement part contains multiple passive statements: 2 concurrent_assertions (checking reset and enable) + 1 passive process (periodic monitoring), verifying the entity-level statement part can contain multiple passive statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity esp_ent is port(clk,rst,en:in bit); end entity;
architecture bh of esp_ent is
begin
  assert not(rst='0' and en='1') report "reset+enable conflict" severity error;
  postponed assert clk'stable(500 ps) report "clk jitter" severity warning;
  p_watch:process is begin assert en='1' severity note; wait for 100 ns; end process;
end architecture bh;
