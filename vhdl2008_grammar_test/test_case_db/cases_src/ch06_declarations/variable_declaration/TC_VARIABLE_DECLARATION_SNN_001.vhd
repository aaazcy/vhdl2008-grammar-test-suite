-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.4
-- Production: variable_declaration ::= [ shared ] variable identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Negative
-- Test Focus: ERROR: variable_declaration missing the colon before subtype_indication.
-- Expected Result: Triggers syntax error (missing colon)
-- Dependencies: None
-- =============================================================
entity variable_decl_snn1 is
end entity variable_decl_snn1;

architecture arch of variable_decl_snn1 is
begin
  process
    variable v_data bit_vector(7 downto 0);
  begin
    wait;
  end process;
end architecture arch;
