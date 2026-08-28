-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Negative
-- Test Focus: Missing mandatory "process" keyword — the label "p_bad :" and sensitivity list "(clk)" are present but the keyword "process" that must appear between the optional label and the sensitivity list is absent, violating the BNF rule that the reserved word "process" is mandatory in every process_statement
-- Expected Result: Triggers syntax error: missing "process" keyword
-- Dependencies: None
-- =============================================================
entity proc_snn4_ent is
  port(clk, d : in bit; q : out bit);
end entity proc_snn4_ent;
architecture bh of proc_snn4_ent is
begin
  p_bad : (clk)  -- ERROR: missing "process" keyword after label
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end architecture bh;
