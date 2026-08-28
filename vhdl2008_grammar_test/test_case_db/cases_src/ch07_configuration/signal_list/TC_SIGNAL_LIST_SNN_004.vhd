-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Negative
-- Test Focus: double comma in signal_list — a signal_name is missing between two commas, producing an empty element, the syntax requires one legal signal_name identifier between each pair of commas
-- Expected Result: Triggers syntax error: unexpected consecutive commas in signal_list
-- Dependencies: None
-- =============================================================
entity sl_snn4_ent is
  port(q0, q1 : out bit bus);
end entity;

architecture rtl of sl_snn4_ent is
  signal s0, s1 : bit bus := '0';
  -- ERROR: double comma — empty element between commas
  disconnect s0,, s1 : bit after 1 ns;
begin
  s0 <= '0'; s1 <= '1'; q0 <= s0; q1 <= s1;
end architecture rtl;
