-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_declaration ::= signal identifier_list : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Negative
-- Test Focus: signal_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity signal_declarat_e2 is end entity;
architecture bh of signal_declarat_e2 is
  -- ERROR: invalid syntax in signal_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;