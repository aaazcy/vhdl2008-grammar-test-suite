-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: package_body_declarative_item: type_declaration and alias_declaration — exercises type and alias as package_body_declarative_item alternatives, both commonly used inside package bodies to simplify complex type references
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pbdi_type_alias is
  port (
    addr_in  : in  bit_vector(15 downto 0);
    low_byte : out bit_vector(7 downto 0)
  );
end entity;

architecture test of pbdi_type_alias is
  -- type_declaration (valid declarative item)
  type addr_t is array(0 to 1) of bit_vector(7 downto 0);
  -- alias_declaration (valid declarative item)
  alias a_lo is addr_in(7 downto 0);
  alias a_hi is addr_in(15 downto 8);

  -- subprogram_body (valid declarative item)
  function f_get_lo(a : bit_vector(15 downto 0)) return bit_vector is
  begin
    return a(7 downto 0);
  end function;
begin
  low_byte <= f_get_lo(addr_in);
end architecture test;
