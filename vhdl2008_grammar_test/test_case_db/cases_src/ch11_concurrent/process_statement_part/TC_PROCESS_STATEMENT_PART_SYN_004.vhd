-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement_part ::= { sequential_statement }
-- Case Type: Positive
-- Test Focus: Empty process body——`process(clk) begin end process;` has no sequential statement, verifying that a process_statement_part can be empty
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity psp_empty_ent is
  port(clk : in bit);
end entity psp_empty_ent;
architecture bh of psp_empty_ent is
begin
  process(clk) is
  begin
  end process;
end architecture bh;
