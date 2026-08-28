-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Negative
-- Test Focus: SNN: trailing comma — `process(a,)` extra comma at the end, another signal_name should follow the comma
-- Expected Result: Triggers syntax error: unexpected ',' before ')', expected signal name
-- Dependencies: None
-- =============================================================
entity sl_snn3_ent is port(a:in bit; y:out integer); end entity;
architecture bh of sl_snn3_ent is
begin
  process(a,) is
  begin
    y <= 1;
  end process;
end architecture bh;
