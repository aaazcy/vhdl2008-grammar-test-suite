-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Negative
-- Test Focus: SNN: empty sensitivity_list — `process()` has no signal name inside the parentheses, at least one signal_name is required
-- Expected Result: Triggers syntax error: empty sensitivity list
-- Dependencies: None
-- =============================================================
entity sl_snn1_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sl_snn1_ent is
begin
  process() is
  begin
    y <= 1;
  end process;
end architecture bh;
