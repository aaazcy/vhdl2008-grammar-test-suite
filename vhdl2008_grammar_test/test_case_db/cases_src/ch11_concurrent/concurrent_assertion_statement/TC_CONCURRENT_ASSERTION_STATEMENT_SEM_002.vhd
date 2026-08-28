-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Rule Description: A postponed concurrent assertion evaluates after all signal values have stabilized in a simulation cycle, ensuring it sees the final settled values rather than intermediate transient ones
-- Case Type: Positive
-- Test Focus: a postponed assertion evaluates at the end of the delta cycle — the postponed assert checks the final settled value, and the coexistence of a normal concurrent assignment with a postponed assert verifies that postponed sees the settled result after delta delay
-- Expected Result: Compiles successfully; postponed assertion sees settled values
-- Dependencies: None
-- =============================================================
entity ca_sem2_ent is
  port(clk : in bit; a, b : in integer; sum : out integer);
end entity ca_sem2_ent;
architecture bh of ca_sem2_ent is
  signal s_tmp : integer;
begin
  s_tmp <= a + b;
  sum <= s_tmp;
  postponed assert sum = a + b
    report "postponed check: sum mismatch" severity error;
end architecture bh;
