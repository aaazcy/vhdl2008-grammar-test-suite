-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Case Type: Negative
-- Test Focus: SNN: unclosed sensitivity_list parentheses——`process(clk, rst_n` lacks the right parenthesis, verifying that the parentheses of the process sensitivity list must be paired
-- Expected Result: Triggers syntax error: missing closing ")" in process sensitivity list
-- Dependencies: None
-- =============================================================
entity psl_snn1_ent is
  port(clk, rst_n : in bit; q : out bit);
end entity psl_snn1_ent;
architecture bh of psl_snn1_ent is
begin
  process(clk, rst_n is
  begin
    if rst_n = '0' then q <= '0';
    elsif clk'event and clk = '1' then q <= '1'; end if;
  end process;
end architecture bh;
