-- =============================================================
-- Case ID: TC_ENTITY_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_statement ::= concurrent_assertion | passive_concurrent_procedure_call | passive_process
-- Case Type: Positive
-- Test Focus: Entity statement part mixes all 3 kinds: postponed assertion + passive concurrent procedure call + passive process coexist
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity es_full_ent is port(clk:in bit; data:in integer); end entity;
architecture bh of es_full_ent is
  procedure p_mon(signal v:in integer) is begin report "data=" & integer'image(v) severity note; end procedure;
begin
  postponed assert clk'stable(1 ns) report "clk unstable" severity warning;
  p_mon(data);
  p_passive:process is begin assert data>=0 severity error; wait for 50 ns; end process;
end architecture bh;
