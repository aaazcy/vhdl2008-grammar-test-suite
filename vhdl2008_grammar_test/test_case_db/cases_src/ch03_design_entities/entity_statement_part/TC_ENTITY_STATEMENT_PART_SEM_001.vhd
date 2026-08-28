-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ESP_001
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: concurrent assertions in entity_statement_part correctly evaluate port states during simulation — assertions can legally reference entity ports
-- Case Type: Positive
-- Error Category: runtime_assertion_check
-- Test Focus: Positive example: the entity statement part contains a concurrent_assertion checking the mutual exclusion of rst and en (not(rst='0' and en='1')) and a postponed assert checking clk stability, assertions referencing entity ports (rst/en/clk) are legal, verifying entity_statement can perform passive monitoring of entity ports
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity esp_sem_ent is
  port(clk,rst,en:in bit);
begin
  assert not(rst='0' and en='1')
    report "protocol violation: reset+enable" severity error;
  postponed assert clk'stable(1 ns) or clk'event
    report "clock unstable in entity monitor" severity warning;
end entity esp_sem_ent;
architecture bh of esp_sem_ent is
  signal s_state:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then s_state<=s_state+1; end if;
  end process;
end architecture bh;
