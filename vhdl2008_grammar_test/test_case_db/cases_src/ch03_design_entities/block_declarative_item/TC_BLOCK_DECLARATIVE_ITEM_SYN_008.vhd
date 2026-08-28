-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Positive
-- Test Focus: block_declarative_item with subprogram_body(function+procedure): the block declares a full function body (with local variables and return) and a procedure body (with out signal parameter), verifying complete subprogram body definitions within the block declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdi_subp_ent is
  port(a : in integer; y : out integer);
end entity;
architecture bh of bdi_subp_ent is
begin
  b_subp : block
    function f_scale(x : integer) return integer is
      variable v : integer := x;
    begin
      if v < 0 then return 0;
      elsif v > 100 then return 100;
      else return v * 2;
      end if;
    end function;
    procedure p_assign(signal target : out integer; value : in integer) is
    begin
      target <= value;
    end procedure;
    signal s_result : integer := 0;
  begin
    p_assign(s_result, f_scale(a));
    y <= s_result;
  end block;
end architecture bh;
