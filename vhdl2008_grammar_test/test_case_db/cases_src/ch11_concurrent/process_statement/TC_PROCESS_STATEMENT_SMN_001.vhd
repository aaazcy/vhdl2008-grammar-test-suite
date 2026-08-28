-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_PROCESS_WAIT_SENSITIVITY
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Negative
-- Error Category: semantic_rule_violation
-- Test Focus: wait statement inside a process that also has a sensitivity list — IEEE 1076-2008 Section 11.3 explicitly prohibits a process from containing both a sensitivity list and any wait statements because the sensitivity list implies an implicit wait on the listed signals, making an explicit wait redundant and semantically invalid
-- Expected Result: Triggers semantic error: wait statement not allowed in process with sensitivity list
-- Dependencies: None
-- =============================================================
entity proc_smn1_ent is
  port(clk : in bit; y : out bit);
end entity proc_smn1_ent;
architecture bh of proc_smn1_ent is
begin
  process(clk)
  begin
    wait until clk = '1';  -- ERROR: wait inside process with sensitivity list
    y <= not y;
  end process;
end architecture bh;
