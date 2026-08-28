-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: alias_declaration as subprogram_declarative_item: alias renames an externally visible type inside function, verification of scope capability of alias in subprogram definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_alias_ent is port(v:in bit_vector(3 downto 0); r:out integer); end entity;
architecture bh of sdi_alias_ent is
  function f_bit_pos(x:bit_vector(3 downto 0)) return integer is
    alias a is bit_vector;
  begin
    for i in x'range loop if x(i)='1' then return i; end if; end loop;
    return -1;
  end function;
begin
  r<=f_bit_pos(v);
end architecture bh;
