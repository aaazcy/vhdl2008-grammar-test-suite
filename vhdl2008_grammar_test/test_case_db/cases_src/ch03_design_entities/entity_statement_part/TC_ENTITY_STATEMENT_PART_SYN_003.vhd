-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement_part ::= { entity_statement }
-- Case Type: Positive
-- Test Focus: Single passive process as entity_statement — after entity begin there is one passive process (X detection on the data signal), the process has no sensitivity list and uses wait on, verifying passive process_statement as entity_statement is legal in the entity statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity esp_proc_ent is
  port(data:in bit_vector(7 downto 0); alert:out bit);
begin
  p_check:process is
  begin
    wait on data;
    assert data/="11111111"
      report "data bus undefined" severity error;
  end process p_check;
end entity esp_proc_ent;
architecture bh of esp_proc_ent is
begin end architecture bh;
