-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Negative
-- Test Focus: ERROR: uses "wire" as a signal_kind which is not valid VHDL. The BNF only allows register or bus.
-- Expected Result: Triggers syntax error (invalid signal kind)
-- Dependencies: None
-- =============================================================
entity signal_kind_snn1 is
end entity signal_kind_snn1;

architecture arch of signal_kind_snn1 is
  signal s_bad : bit wire;
begin
end architecture arch;
