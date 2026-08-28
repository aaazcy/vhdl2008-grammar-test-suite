-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_declaration ::= signal identifier_list : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Negative
-- Test Focus: signal_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity signal_declarat_e3 is end entity;
architecture bh of signal_declarat_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;