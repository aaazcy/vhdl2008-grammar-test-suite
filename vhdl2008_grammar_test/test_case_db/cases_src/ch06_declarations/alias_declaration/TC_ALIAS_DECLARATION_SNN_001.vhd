-- =============================================================
-- Case ID: TC_ALIAS_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_declaration ::= alias alias_designator [ : subtype_indication ] is name [ signature ] ;
-- Case Type: Negative
-- Test Focus: ERROR: alias_declaration missing the "is" keyword. BNF requires "alias alias_designator ... is name".
-- Expected Result: Triggers syntax error (missing is keyword)
-- Dependencies: None
-- =============================================================
entity alias_decl_snn1 is
end entity alias_decl_snn1;

architecture arch of alias_decl_snn1 is
  signal s_data : bit_vector(7 downto 0);
  alias a_byte s_data;
begin
end architecture arch;
