-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement | PSL_PSL_Directive
-- Case Type: Positive
-- Test Focus: Entity statement part contains a passive concurrent procedure call + label: a passive concurrent procedure call with explicit label, (label: proc_name(args)), verifying passive_concurrent_procedure_call, one of the entity_statement forms, supports the full syntax with a label
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity es_pcall_lbl is
  port(en:in bit; addr:in integer);
end entity;
architecture bh of es_pcall_lbl is
  procedure p_addr_chk(signal v:in integer) is
  begin
    assert v>=0 and v<=1023
      report "address out of valid range" severity error;
  end procedure;
begin
  addr_monitor: p_addr_chk(addr);
end architecture bh;
