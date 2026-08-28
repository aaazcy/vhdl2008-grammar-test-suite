-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: variable_declaration(shared) + disconnection_specification as package_declarative_item: verification that shared variable and disconnection spec are legal in package declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_shv_item is
  type t_pt is protected
    procedure set_id(v:in integer);
    impure function get_id return integer;
  end protected t_pt;
  shared variable sv_id:t_pt;
  type t_guard is (active, idle);
  signal s_mode:t_guard:=idle;
end package pkg_shv_item;
package body pkg_shv_item is
  type t_pt is protected body
    variable v_id:integer:=0;
    procedure set_id(v:in integer) is begin v_id:=v; end procedure;
    impure function get_id return integer is begin return v_id; end function;
  end protected body t_pt;
end package body pkg_shv_item;
entity pdi_shv_ent is port(r:out integer); end entity;
architecture bh of pdi_shv_ent is begin r<=work.pkg_shv_item.sv_id.get_id; end architecture bh;
