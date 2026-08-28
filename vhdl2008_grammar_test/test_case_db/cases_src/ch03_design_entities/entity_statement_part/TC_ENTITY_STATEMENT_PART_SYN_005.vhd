-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Positive
-- Test Focus: concurrent_assertion+passive process mixed in the entity statement part — after entity begin there are an assert (en stability check) and a passive process (wait for periodic heartbeat detection), verifying different types of entity_statement (concurrent_assertion + process) can be mixed in the same entity statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity esp_mix2_ent is
  port(clk,en:in bit; heartbeat:out bit);
begin
  assert en'stable(1 ns) or en='0'
    report "enable glitch detected" severity note;
  p_beat:process is
    variable v_toggle:bit:='0';
  begin
    wait for 100 ns;
    v_toggle:=not v_toggle;
  end process p_beat;
end entity esp_mix2_ent;
architecture bh of esp_mix2_ent is
begin end architecture bh;
