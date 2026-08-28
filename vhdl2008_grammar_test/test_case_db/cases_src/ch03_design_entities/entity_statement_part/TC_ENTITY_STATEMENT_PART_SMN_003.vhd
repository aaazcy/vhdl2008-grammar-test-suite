-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_ESP_005
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: the wait statement of a passive process in entity_statement_part must be reachable — the signal referenced by wait must be in the entity port list
-- Case Type: Negative
-- Error Category: undeclared_signal_error
-- Test Focus: Negative example: wait on ghost_signal in the passive process of the entity statement part, ghost_signal does not exist in the entity port list, although the internal process syntax is correct the signal referenced by wait on does not exist at the entity level, verifying signal references in the entity statement part are limited by the entity port scope
-- Expected Result: Triggers semantic error: signal ghost_signal not declared in entity
-- Dependencies: None
-- =============================================================
entity esp_smn3_ent is
  port(clk:in bit);
begin
  p_bad:process is
  begin
    wait on ghost_signal;
  end process p_bad;
end entity esp_smn3_ent;
architecture bh of esp_smn3_ent is
begin end architecture bh;
