-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Negative
-- Test Focus: the "all" keyword mixed with explicit signal names — in signal_list "all" appears together with the signal name "s_active" in a comma-separated list, but "all" must be used standalone as the only alternative and cannot be mixed with signal names
-- Expected Result: Triggers syntax error: "all" cannot be mixed with signal names in signal_list
-- Dependencies: None
-- =============================================================
entity sl_snn5_ent is
  port(r : out bit bus);
end entity;

architecture rtl of sl_snn5_ent is
  signal s_active : bit bus := '0';
  -- ERROR: "all" mixed with explicit signal name
  disconnect all, s_active : bit after 1 ns;
begin
  s_active <= '1'; r <= s_active;
end architecture rtl;
