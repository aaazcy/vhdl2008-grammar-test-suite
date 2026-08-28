-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Negative
-- Test Focus: missing colon before the type_mark — the type_mark "bit" appears directly after signal_list without the colon separator, the disconnect specification requires a colon between signal_list and type_mark
-- Expected Result: Triggers syntax error: expected ":" after signal_list in disconnect specification
-- Dependencies: None
-- =============================================================
entity sl_snn6_ent is
  port(r : out bit bus);
end entity;

architecture rtl of sl_snn6_ent is
  signal s_wire : bit bus := '0';
  -- ERROR: missing colon between signal_list and type_mark
  disconnect s_wire bit after 1 ns;
begin
  s_wire <= '1'; r <= s_wire;
end architecture rtl;
