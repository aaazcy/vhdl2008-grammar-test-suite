-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Negative
-- Test Focus: Missing mandatory "end process" keyword — a labeled process with sensitivity list, declarative items, and a complete begin...body is left unterminated; the parser expects "end process" to close the process_statement but encounters "end architecture" instead, violating the BNF requirement that every process_statement closes with "end process [ process_label ] ;"
-- Expected Result: Triggers syntax error: missing "end process"
-- Dependencies: None
-- =============================================================
entity proc_snn2_ent is
  port(clk, d : in bit; q : out bit);
end entity proc_snn2_ent;
architecture bh of proc_snn2_ent is
begin
  p_bad : process(clk)
    variable v : bit;
  begin
    if clk'event and clk = '1' then
      v := d;
      q <= v;
    end if;
  -- ERROR: missing "end process p_bad;"
end architecture bh;
