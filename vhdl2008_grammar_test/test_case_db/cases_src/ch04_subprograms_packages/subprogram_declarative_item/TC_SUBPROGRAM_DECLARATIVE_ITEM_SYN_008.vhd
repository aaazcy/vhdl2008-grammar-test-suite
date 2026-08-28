-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: subprogram_declarative_item: alias_declaration inside a function — exercises alias as a subprogram_declarative_item, used to create local shorthand names for parameters or complex array slices
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_alias is
  port (
    full_word : in  bit_vector(31 downto 0);
    byte0     : out bit_vector(7 downto 0);
    byte3     : out bit_vector(7 downto 0)
  );
end entity;

architecture test of sdi_alias is
  function f_get_byte(word : bit_vector(31 downto 0); n : natural) return bit_vector is
    -- alias_declaration (subprogram_declarative_item)
    alias w is word;
    variable v_byte : bit_vector(7 downto 0);
  begin
    -- use the alias to extract byte n (0..3)
    v_byte := w(8*n + 7 downto 8*n);
    return v_byte;
  end function;
begin
  byte0 <= f_get_byte(full_word, 0);
  byte3 <= f_get_byte(full_word, 3);
end architecture test;
