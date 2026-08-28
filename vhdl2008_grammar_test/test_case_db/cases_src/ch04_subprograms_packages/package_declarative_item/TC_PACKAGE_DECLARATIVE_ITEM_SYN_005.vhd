-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: subprogram_declaration(forward) as package_declarative_item: function f_add declared in package with body implemented in package body, verification that forward declaration is a legal declarative item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_fwd_pdi is
  function f_add(a,b:integer) return integer;
end package pkg_fwd_pdi;
package body pkg_fwd_pdi is
  function f_add(a,b:integer) return integer is begin return a+b; end function;
end package body pkg_fwd_pdi;
entity pdi_fwd_ent is port(x,y:in integer; z:out integer); end entity;
architecture bh of pdi_fwd_ent is begin z<=work.pkg_fwd_pdi.f_add(x,y); end architecture bh;
