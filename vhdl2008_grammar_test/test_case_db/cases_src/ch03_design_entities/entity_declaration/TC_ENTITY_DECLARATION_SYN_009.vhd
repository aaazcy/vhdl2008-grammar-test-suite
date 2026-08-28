-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Statement part — passive concurrent statements: entity includes `begin entity_statement_part`, the statement part has concurrent_assertion(immediate assertion checking clk period) + passive_process(no sensitivity list, with periodic wait for report) + passive concurrent_procedure_call(reads entity port values and reports), verifying the 3 passive statement forms allowed in the entity-level statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_stmts is
  port(
    clk    : in bit;
    status : in integer
  );
end entity ent_stmts;
architecture bh of ent_stmts is
  procedure p_monitor(signal v : in integer) is
  begin
    report "entity status=" & integer'image(v) severity note;
  end procedure;
begin
  assert clk'event or clk = '1'
    report "clk must toggle" severity warning;
  p_monitor(status);
  p_passive : process is
  begin
    assert status >= 0 report "status negative in entity scope" severity error;
    wait for 100 ns;
  end process;
end architecture bh;
