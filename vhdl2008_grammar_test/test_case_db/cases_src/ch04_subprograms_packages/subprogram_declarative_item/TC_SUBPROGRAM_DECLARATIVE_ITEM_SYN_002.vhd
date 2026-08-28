-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: type_declaration + constant_declaration as subprogram_declarative_item: integer subtype + constant declared in function, verification of two declaration item classes used in subprogram body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_tc_ent is port(v:in integer range 0 to 255; r:out integer); end entity;
architecture bh of sdi_tc_ent is
  function f_saturate(x:integer) return integer is
    subtype t_byte is integer range 0 to 255;
    constant C_MAX:t_byte:=255;
    variable v_val:t_byte;
  begin
    if x>C_MAX then v_val:=C_MAX; else v_val:=t_byte(x); end if;
    return v_val;
  end function;
begin
  r<=f_saturate(v);
end architecture bh;
