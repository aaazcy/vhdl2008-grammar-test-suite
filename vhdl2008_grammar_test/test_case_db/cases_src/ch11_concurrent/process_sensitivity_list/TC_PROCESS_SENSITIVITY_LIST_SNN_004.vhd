-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Case Type: Negative
-- Test Focus: SNN: wrong separator in sensitivity_list——`process(clk:rst_n)` separates the signals with a colon instead of a comma, verifying that signals in a sensitivity_list must be separated by commas
-- Expected Result: Triggers syntax error: expected "," in sensitivity list
-- Dependencies: None
-- =============================================================
entity psl_snn4_ent is
  port(clk, rst_n : in bit; q : out bit);
end entity psl_snn4_ent;
architecture bh of psl_snn4_ent is
begin
  process(clk : rst_n) is
  begin
    if rst_n = '0' then q <= '0';
    elsif clk'event and clk = '1' then q <= '1'; end if;
  end process;
end architecture bh;
