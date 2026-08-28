-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_declaration ::= signal identifier_list : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Negative
-- Test Focus: ERROR: signal_declaration missing the "signal" keyword. BNF requires the keyword "signal" before the identifier_list.
-- Expected Result: Triggers syntax error (missing signal keyword)
-- Dependencies: None
-- =============================================================
entity signal_decl_snn1 is
end entity signal_decl_snn1;

architecture arch of signal_decl_snn1 is
  s_data : bit_vector(7 downto 0);
begin
end architecture arch;
