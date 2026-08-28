-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SNN_006
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Negative
-- Test Focus: Trailing comma in guarded_signal_list before colon -- the guarded_signal_list must end with a signal name before the colon; a trailing comma ("s_a, : bit") is invalid syntax
-- Expected Result: Triggers syntax error (unexpected colon after comma)
-- Dependencies: None
-- =============================================================
entity gss_snn6_trail_comma is
  port(r : out bit bus);
end entity;

architecture bh of gss_snn6_trail_comma is
  signal s_a : bit bus := '0';
  -- ERROR: trailing comma before colon in guarded_signal_list
  disconnect s_a, : bit after 3 ns;
begin
  s_a <= '1';
  r <= s_a;
end architecture bh;
