-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Negative
-- Test Focus: Process label mismatch between opening label and closing label — the process opens with label "p_one" but closes with "end process p_two", violating the BNF rule that the optional [ process_label ] after "end process" must match the opening label exactly when both are present
-- Expected Result: Triggers syntax error: process label mismatch
-- Dependencies: None
-- =============================================================
entity proc_snn3_ent is
  port(a : in bit; y : out bit);
end entity proc_snn3_ent;
architecture bh of proc_snn3_ent is
begin
  p_one : process(a)
  begin
    y <= not a after 1 ns;
  end process p_two;  -- ERROR: label mismatch p_two != p_one
end architecture bh;
