-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Production: concurrent_statement ::= block_statement | process_statement | concurrent_procedure_call_statement | concurrent_assertion_statement | concurrent_signal_assignment_statement | component_instantiation_statement | generate_statement
-- Case Type: Positive
-- Test Focus: generate statement as a concurrent statement——`for i in 0 to 3 generate ...` the for generate appears in the concurrent statement position, verifying that a generate_statement is a legal concurrent statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cs_gen_ent is
  port(clk : in bit; din : in bit; dout : out bit);
end entity cs_gen_ent;
architecture bh of cs_gen_ent is
  signal s_chain : bit_vector(0 to 4);
begin
  s_chain(0) <= din;
  gen_sr : for i in 0 to 3 generate
  begin
    s_chain(i+1) <= s_chain(i);
  end generate gen_sr;
  dout <= s_chain(4);
end architecture bh;
