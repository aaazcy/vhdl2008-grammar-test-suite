-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Negative
-- Test Focus: SNN: numeric literal used as signal name — `process(123)` a number is not a valid identifier
-- Expected Result: Triggers syntax error: expected signal name identifier, found integer literal
-- Dependencies: None
-- =============================================================
entity sl_snn4_ent is port(y:out integer); end entity;
architecture bh of sl_snn4_ent is
begin
  process(123) is
  begin
    y <= 1;
  end process;
end architecture bh;
