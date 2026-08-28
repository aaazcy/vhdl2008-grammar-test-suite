-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Test Focus: Entity statement part: zero or more entity_statements (passive only)
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_entity_statement_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_entity_statement_part_syn_s01 is
    signal s_esp:integer:=0;
begin
  assert false report "entity_stmt_part test" severity note; r<=s_esp;end architecture bh;
