-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_SENS_LIST_NOT_SIGNAL
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Negative
-- Test Focus: SMN: integer literal appears in the sensitivity_list of a process — in process(5), 5 is not a signal name, every element of sensitivity_list must be a signal_name
-- Expected Result: Triggers analysis error: name expected here, found '<integer>'
-- Dependencies: None
-- =============================================================
entity sens_list_literal is port(a:in bit; y:out integer); end entity;
architecture vhdl2008 of sens_list_literal is
begin
  process(5) is
  begin
    y <= 1;
  end process;
end architecture vhdl2008;
