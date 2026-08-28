-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement ::= [ process_label : ] process [ ( process_sensitivity_list ) ] [ is ] process_declarative_part begin process_statement_part end process [ process_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "begin" — the process declarative part contains a variable but a statement appears directly after the declarative part without the begin separating keyword, verifying that a process body must use begin to separate the declarative part from the statement part
-- Expected Result: Triggers syntax error: missing "begin" in process
-- Dependencies: None
-- =============================================================
entity proc_snn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of proc_snn1_ent is
begin
  process(a) variable v:integer; v:=a; y<=v; end process;
end architecture bh;
