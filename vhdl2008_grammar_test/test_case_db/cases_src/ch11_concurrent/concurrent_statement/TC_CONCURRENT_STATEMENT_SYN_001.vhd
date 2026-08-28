-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Production: concurrent_statement ::= block_statement | process_statement | concurrent_procedure_call_statement | concurrent_assertion_statement | concurrent_signal_assignment_statement | component_instantiation_statement | generate_statement
-- Case Type: Positive
-- Test Focus: process as a concurrent statement——`proc_reg : process(clk) ...` verifies that a process_statement is the most common form of concurrent statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cs_proc_ent is
  port(clk, d : in bit; q : out bit);
end entity cs_proc_ent;
architecture bh of cs_proc_ent is
begin
  proc_reg : process(clk) is
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end process proc_reg;
end architecture bh;
