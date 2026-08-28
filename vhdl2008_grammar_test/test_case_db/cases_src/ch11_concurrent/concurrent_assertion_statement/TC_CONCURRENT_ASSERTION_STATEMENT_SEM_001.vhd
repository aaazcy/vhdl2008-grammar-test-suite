-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Rule Description: A concurrent assertion statement is a process-like statement that evaluates its condition whenever any signal in the condition changes; it is equivalent to a process with the assertion as its only sequential statement and a sensitivity list of all signals read in the condition
-- Case Type: Positive
-- Test Focus: a concurrent assertion is equivalent to a process — the assert monitors the setup/hold condition of clk and data and evaluates automatically whenever a sensitive signal changes, verifying the process-equivalent semantics of a concurrent assertion
-- Expected Result: Compiles successfully; assertion fires on any signal change in condition
-- Dependencies: None
-- =============================================================
entity ca_sem1_ent is
  port(clk, data : in bit; q : out bit);
end entity ca_sem1_ent;
architecture bh of ca_sem1_ent is
begin
  assert not (clk'event and clk = '1' and not data'stable(2 ns))
    report "setup time violation: data changed within 2ns of clock edge"
    severity warning;
  process(clk) is
  begin
    if clk'event and clk = '1' then
      q <= data;
    end if;
  end process;
end architecture bh;
