-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: constant_declaration + variable_declaration as a package_body_declarative_item sequence: two declaration items appear consecutively in body, verification of legality of mixed declarative items in body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_constvar is
  constant C_MAX:integer:=100;
  constant C_MIN:integer:=0;
end package pkg_constvar;
package body pkg_constvar is
  constant C_BODY:integer:=1;
  type t_pt is protected
    procedure set_id(v:in integer);
    impure function get_id return integer;
  end protected t_pt;
  type t_pt is protected body
    variable v_id:integer:=0;
    procedure set_id(v:in integer) is begin v_id:=v; end procedure;
    impure function get_id return integer is begin return v_id; end function;
  end protected body t_pt;
  shared variable sv_counter:t_pt;
end package body pkg_constvar;
entity pbdi_cv_ent is port(hi,lo:out integer); end entity;
architecture bh of pbdi_cv_ent is begin hi<=work.pkg_constvar.C_MAX; lo<=work.pkg_constvar.C_MIN; end architecture bh;
