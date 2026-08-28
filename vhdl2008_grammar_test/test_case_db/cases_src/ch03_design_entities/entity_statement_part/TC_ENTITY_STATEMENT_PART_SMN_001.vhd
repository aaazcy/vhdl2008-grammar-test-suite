-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ESP_003
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: passive statements in entity_statement_part must not drive output ports — only monitoring/checking/reporting operations are allowed
-- Case Type: Negative
-- Error Category: passive_process_violation
-- Test Focus: Negative example: the passive process in the entity statement part directly performs the signal assignment y<='1' on output port y, although the process is syntactically marked passive, semantically driving the entity output violates the passive constraint, verifying the behavior of driving output ports in the entity statement part is rejected by semantic analysis
-- Expected Result: Triggers semantic error: passive process cannot drive output port in entity statement part
-- Dependencies: None
-- =============================================================
entity esp_smn1_ent is
  port(clk:in bit; y:out bit);
begin
  process is
  begin
    wait on clk;
    y<='1';
  end process;
end entity esp_smn1_ent;
architecture bh of esp_smn1_ent is
begin end architecture bh;
