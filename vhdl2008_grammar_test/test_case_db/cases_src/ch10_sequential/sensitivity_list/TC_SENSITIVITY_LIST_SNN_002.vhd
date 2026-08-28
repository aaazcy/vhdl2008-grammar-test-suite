-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Negative
-- Test Focus: SNN: wrong separator — `process(a b)` missing comma between the two signals, separated by a space
-- Expected Result: Triggers syntax error: missing ',' between signal names
-- Dependencies: None
-- =============================================================
entity sl_snn2_ent is port(a,b:in bit; y:out integer); end entity;
architecture bh of sl_snn2_ent is
begin
  process(a b) is
  begin
    y <= 1;
  end process;
end architecture bh;
