-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: four declarative_items type+subtype+constant+variable mixed in subprogram: verification of high-density declaration item combination in subprogram declaration region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_dense_ent is port(a:in integer; lo,hi:in integer; y:out integer); end entity;
architecture bh of sdi_dense_ent is
  procedure p_clip(signal inp:in integer; signal low,high:in integer; signal outv:out integer) is
    type t_wide is range -100000 to 100000;
    subtype t_narrow is t_wide range -32768 to 32767;
    constant C_MIN:t_narrow:=t_narrow(low);
    constant C_MAX:t_narrow:=t_narrow(high);
    variable v_val:t_narrow;
  begin
    v_val:=t_narrow(inp);
    if v_val<C_MIN then v_val:=C_MIN; elsif v_val>C_MAX then v_val:=C_MAX; end if;
    outv<=integer(v_val);
  end procedure;
begin
  p_clip(a,lo,hi,y);
end architecture bh;
