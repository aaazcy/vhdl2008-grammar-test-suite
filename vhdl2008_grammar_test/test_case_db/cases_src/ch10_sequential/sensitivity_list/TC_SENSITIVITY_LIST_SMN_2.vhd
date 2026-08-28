-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SENS_LIST_SIGNAL
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Negative
-- Test Focus: SEM: sensitivity_list contains a variable name instead of a signal — in process(v), v is a variable not a signal
-- Expected Result: Triggers semantic error: item in sensitivity list must be a signal, not a variable
-- Dependencies: None
-- =============================================================
entity sl_sem1_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sl_sem1_ent is
  shared variable v_sh : bit := '0';
begin
  process(v_sh) is
  begin
    y <= 1;
  end process;
end architecture bh;
