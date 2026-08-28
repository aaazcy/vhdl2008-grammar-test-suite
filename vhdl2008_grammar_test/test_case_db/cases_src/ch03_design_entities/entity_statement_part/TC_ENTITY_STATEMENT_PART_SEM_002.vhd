-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ESP_002
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: the passive process in entity_statement_part can periodically perform passive monitoring operations without driving any entity ports
-- Case Type: Positive
-- Error Category: semantic_compliance
-- Test Focus: Positive example: the entity statement part contains a passive process that only monitors the clk input and accumulates an internal variable count, driving no signals (passive compliant, no signal assignment), verifying the legal semantic behavior of a passive process containing only monitoring logic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity esp_sem2_ent is
  port(clk:in bit; monitor_ok:out bit);
begin
  p_watchdog:process is
    variable v_count:integer:=0;
  begin
    wait on clk;
    if clk='1' then v_count:=v_count+1; end if;
  end process p_watchdog;
end entity esp_sem2_ent;
architecture bh of esp_sem2_ent is
  signal s_data:bit;
begin
  process(clk) begin
    if clk'event and clk='1' then s_data<=not s_data; end if;
  end process;
end architecture bh;
