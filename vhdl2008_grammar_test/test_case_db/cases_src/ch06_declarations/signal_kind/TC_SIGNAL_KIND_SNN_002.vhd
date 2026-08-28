-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Negative
-- Test Focus: signal_kind: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity signal_kind_e2 is end entity;
architecture bh of signal_kind_e2 is
  -- ERROR: invalid syntax in signal_kind
  signal s : bit;
begin
  s <= '1'
end architecture bh;