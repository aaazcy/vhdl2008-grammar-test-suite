-- =============================================================
-- Case ID: TC_INTERFACE_SIGNAL_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_signal_declaration ::= [ signal ] identifier_list : [ mode ] subtype_indication [ bus ] [ := static_expression ]
-- Case Type: Negative
-- Test Focus: interface_signal_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_signa_e3 is end entity;
architecture bh of interface_signa_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;