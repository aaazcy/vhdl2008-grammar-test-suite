-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_PROCESS_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Negative
-- Error Category: semantic_rule_violation
-- Test Focus: Signal declaration inside process_declarative_part — per IEEE 1076-2008 Section 11.3, process declarative items are restricted to subprogram declarations/bodies, type/subtype declarations, constant/variable/file declarations, alias/attribute declarations/specifications, use clauses, and group template/group declarations; signal declarations are explicitly not permitted in a process declarative region
-- Expected Result: Triggers semantic error: signal declaration not allowed in process declarative part
-- Dependencies: None
-- =============================================================
entity proc_smn2_ent is
  port(clk, d : in bit; q : out bit);
end entity proc_smn2_ent;
architecture bh of proc_smn2_ent is
begin
  process(clk)
    signal s_bad : bit;  -- ERROR: signal declaration not allowed in process
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end architecture bh;
