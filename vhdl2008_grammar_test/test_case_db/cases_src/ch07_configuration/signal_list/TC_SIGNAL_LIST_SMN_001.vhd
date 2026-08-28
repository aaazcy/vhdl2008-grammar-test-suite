-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Negative
-- Test Focus: signal type in signal_list mismatches the disconnect type — in the disconnect specification the type_mark is integer but the signal "g_pulse" in signal_list is declared as bit bus type, the type specified by the disconnect timing must match the type of the guarded signal
-- Expected Result: Triggers semantic error: type mismatch between signal "g_pulse" (bit) and disconnect type_mark (integer)
-- Dependencies: None
-- =============================================================
entity sl_smn1_ent is
  port(trig : in bit; pulse_out : out bit bus);
end entity;

architecture rtl of sl_smn1_ent is
  signal g_pulse : bit bus := '0';
  -- ERROR: signal g_pulse is bit but disconnect specifies integer type
  disconnect g_pulse : integer after 1 ns;
begin
  g_pulse <= trig; pulse_out <= g_pulse;
end architecture rtl;
