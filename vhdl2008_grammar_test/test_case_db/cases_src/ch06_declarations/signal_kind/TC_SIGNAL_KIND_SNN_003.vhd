-- =============================================================
-- Case ID: TC_SIGNAL_KIND_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_KIND
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_kind ::= register | bus
-- Case Type: Negative
-- Test Focus: signal_kind: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity signal_kind_e3 is end entity;
architecture bh of signal_kind_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;