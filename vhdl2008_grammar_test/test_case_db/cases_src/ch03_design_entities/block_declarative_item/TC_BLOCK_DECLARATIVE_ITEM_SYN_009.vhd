-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Positive
-- Test Focus: block_declarative_item with shared_variable_declaration and use_clause: the block declares a shared variable (protected type, 2000 compatible) and a use clause referencing a standard package, verifying that these two declaration items are legal within block scope
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdi_shared_ent is
  port(inc, dec : in bit; count : out integer);
end entity;
architecture bh of bdi_shared_ent is
begin
  b_shared : block
    use std.standard.all;
    type t_pt is protected
      procedure incr;
      procedure decr;
      impure function get return integer;
    end protected t_pt;
    type t_pt is protected body
      variable v_cnt : integer := 0;
      procedure incr is
      begin
        v_cnt := v_cnt + 1;
      end procedure;
      procedure decr is
      begin
        v_cnt := v_cnt - 1;
      end procedure;
      impure function get return integer is
      begin
        return v_cnt;
      end function;
    end protected body t_pt;
    shared variable sv_counter : t_pt;
    signal s_inc, s_dec : bit;
  begin
    s_inc <= inc;
    s_dec <= dec;
    process(s_inc, s_dec)
    begin
      if s_inc'event and s_inc = '1' then
        sv_counter.incr;
      end if;
      if s_dec'event and s_dec = '1' then
        sv_counter.decr;
      end if;
    end process;
    count <= sv_counter.get;
  end block;
end architecture bh;
