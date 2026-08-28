-- =============================================================
-- Case ID: TC_CONCURRENT_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.1
-- Production: concurrent_statement ::= block_statement | process_statement | concurrent_procedure_call_statement | concurrent_assertion_statement | concurrent_signal_assignment_statement | component_instantiation_statement | generate_statement
-- Case Type: Positive
-- Test Focus: component_instantiation_statement as a concurrent statement——verifies that an instantiation statement is a legal concurrent statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cs_inst_ent is
  port(a, b : in bit; y : out bit);
end entity cs_inst_ent;

entity inv is port(x : in bit; z : out bit); end entity inv;
architecture dataflow of inv is begin z <= not x; end architecture dataflow;

architecture struct of cs_inst_ent is
  signal s_not_b : bit;
begin
  u_inv : entity work.inv port map(x => b, z => s_not_b);
  y <= a and s_not_b;
end architecture struct;
