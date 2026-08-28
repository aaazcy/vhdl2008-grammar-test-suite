-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Negative
-- Test Focus: Missing terminating semicolon after "end process" — the process body is syntactically complete (sensitivity list, begin, body, end process) but the mandatory ";" that terminates the process_statement per the BNF rule is omitted, causing the parser to fail when it encounters the next concurrent statement
-- Expected Result: Triggers syntax error: missing ";" after end process
-- Dependencies: None
-- =============================================================
entity proc_snn5_ent is
  port(a : in bit; y, z : out bit);
end entity proc_snn5_ent;
architecture bh of proc_snn5_ent is
begin
  process(a)
  begin
    y <= not a after 1 ns;
  end process  -- ERROR: missing ";"
  z <= a;
end architecture bh;
