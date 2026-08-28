-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: package_declarative_item: signal_declaration and disconnection_specification — exercises that signal declarations (allowed only in package declarations, entity declarative parts) and disconnection_specification are package_declarative_item alternatives
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdi_signal_and_disconnect is
  port (
    sig_in  : in  bit;
    sig_out : out bit
  );
end entity;

architecture test of pdi_signal_and_disconnect is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  -- signal_declaration is a valid package_declarative_item
  signal s_bus : r_bit register := '0';
  -- disconnection_specification is a valid package_declarative_item
  disconnect s_bus : r_bit after 5 ns;

  -- constant_declaration (also valid)
  constant C_DELAY : time := 2 ns;
begin
  b_drv : block (true)
  begin
    s_bus   <= guarded sig_in after C_DELAY;
    sig_out <= s_bus;
  end block;
end architecture test;
