-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Negative
-- Test Focus: a signal referenced in signal_list is undeclared — the signal name "g_data" listed in the disconnect specification does not exist in the declarative region of the architecture, although syntactically the comma separation of signal_list is correct, semantically it references an undeclared identifier
-- Expected Result: Triggers semantic error: "g_data" is not declared as a guarded signal
-- Dependencies: None
-- =============================================================
entity sl_sem1_ent is
  port(din : in bit; dout : out bit bus);
end entity;

architecture rtl of sl_sem1_ent is
  signal g_ctrl : bit bus := '0';
  -- ERROR: "g_data" is not declared in this architecture
  disconnect g_data, g_ctrl : bit after 3 ns;
begin
  g_ctrl <= din; dout <= g_ctrl;
end architecture rtl;
