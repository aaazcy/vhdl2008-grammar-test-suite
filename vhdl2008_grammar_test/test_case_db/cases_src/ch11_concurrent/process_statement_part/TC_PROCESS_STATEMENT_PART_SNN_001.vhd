-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_statement_part ::= { sequential_statement }
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon separating sequential statements——two signal assignments have no semicolon between them, verifying that sequential statements in a process body must be separated by semicolons
-- Expected Result: Triggers syntax error: missing ";" between sequential statements
-- Dependencies: None
-- =============================================================
entity psp_snn1_ent is
  port(clk, a, b : in bit; y : out bit);
end entity psp_snn1_ent;
architecture bh of psp_snn1_ent is
begin
  process(clk) is
    variable v : bit;
  begin
    if clk'event and clk = '1' then
      v := a
      y <= v;
    end if;
  end process;
end architecture bh;
