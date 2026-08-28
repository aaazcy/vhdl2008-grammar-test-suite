-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Positive
-- Test Focus: Entity statement part contains a concurrent_assertion with explicit label: the assert statement is prefixed with label chk_label:, verifying concurrent_assertion_statement, one of the entity_statement forms, supports the full syntax with an explicit label
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity es_assert_lbl is
  port(reset:in bit; data:in integer);
end entity;
architecture bh of es_assert_lbl is
  signal s_data:integer;
begin
  s_data<=data;
  chk_reset: assert reset='0' or reset='1'
    report "reset must be bit value" severity error;
  chk_range: assert s_data>=0 and s_data<256
    report "data out of byte range" severity warning;
end architecture bh;
