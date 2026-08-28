-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Negative
-- Test Focus: Trailing comma in signal_list — a trailing comma after the last signal_name is invalid syntax
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sl_snn2_ent is port(r:out bit); end entity;
architecture bh of sl_snn2_ent is
  signal s : bit bus := '0';
  -- ERROR: trailing comma in signal_list
  disconnect s, : bit after 1 ns;
begin
  s <= '1'; r <= s;
end architecture bh;
