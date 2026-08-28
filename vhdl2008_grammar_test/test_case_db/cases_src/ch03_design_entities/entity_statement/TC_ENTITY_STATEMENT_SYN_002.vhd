-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion_statement | passive_concurrent_procedure_call_statement | passive_process_statement
-- Case Type: Positive
-- Test Focus: Entity statement part contains concurrent assertion + passive concurrent procedure call: the entity statement part contains both a postponed concurrent_assertion(checking timing) + concurrent_procedure_call(passive procedure only reads port values+reports), verifying the entity-level statement part can mix multiple passive concurrent statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity es_mixed is
  port(clk:in bit; data:in integer);
end entity;
architecture bh of es_mixed is
  procedure p_log(signal v:in integer) is
  begin
    report "data=" & integer'image(v) severity note;
  end procedure;
begin
  postponed assert clk'stable(1 ns) report "clk unstable" severity warning;
  p_log(data);
end architecture bh;
