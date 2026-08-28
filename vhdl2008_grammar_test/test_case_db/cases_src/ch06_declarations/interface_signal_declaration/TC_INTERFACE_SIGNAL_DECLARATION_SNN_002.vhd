-- =============================================================
-- Case ID: TC_INTERFACE_SIGNAL_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_signal_declaration ::= [ signal ] identifier_list : [ mode ] subtype_indication [ bus ] [ := static_expression ]
-- Case Type: Negative
-- Test Focus: interface_signal_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_signa_e2 is end entity;
architecture bh of interface_signa_e2 is
  -- ERROR: invalid syntax in interface_signal_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;