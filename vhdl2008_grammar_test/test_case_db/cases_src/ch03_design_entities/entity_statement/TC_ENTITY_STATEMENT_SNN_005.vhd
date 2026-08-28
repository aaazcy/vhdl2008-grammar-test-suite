-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Negative
-- Test Focus: passive_process of entity_statement missing the process keyword: label: is followed directly by begin without process, verifying the required process keyword of passive processes
-- Expected Result: Triggers syntax error on missing 'process' keyword
-- Dependencies: None
-- =============================================================
entity es_snn5_ent is
  port(clk:in bit);
end entity;
architecture bh of es_snn5_ent is
begin
  p_mon:
  begin
    assert clk='1' or clk='0';
    wait for 10 ns;
  end p_mon;
end architecture bh;
