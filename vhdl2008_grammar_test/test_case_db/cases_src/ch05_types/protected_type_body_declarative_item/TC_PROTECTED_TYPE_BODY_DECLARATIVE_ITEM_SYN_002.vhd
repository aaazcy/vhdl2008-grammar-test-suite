-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_item ::=
--   subprogram_declaration | subprogram_body |
--   subprogram_instantiation_declaration | package_declaration |
--   package_body | package_instantiation_declaration |
--   type_declaration | subtype_declaration |
--   constant_declaration | variable_declaration |
--   file_declaration | alias_declaration | attribute_declaration |
--   attribute_specification | use_clause |
--   group_template_declaration | group_declaration
-- Test Focus: Body declarative item — type_declaration:
--   user-defined record type declared inside the protected body
--   and used by body methods.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_type_decl is
  port (
    wr    : in  bit;
    data  : out integer
  );
end entity pt_body_di_type_decl;

architecture rtl of pt_body_di_type_decl is
  type t_fifo is protected
    procedure push(x : integer);
    impure function pop return integer;
  end protected;
  type t_fifo is protected body
    type t_node is record
      val  : integer;
      nxt  : natural;
    end record;
    type t_pool is array(0 to 15) of t_node;
    variable v_pool  : t_pool;
    variable v_head  : natural := 0;
    variable v_count : natural := 0;
    procedure push(x : integer) is
    begin
      v_pool(v_count).val  := x;
      v_pool(v_count).nxt := v_head;
      v_head := v_count;
      v_count := v_count + 1;
    end procedure;
    impure function pop return integer is
      variable r : integer;
    begin
      r := v_pool(v_head).val;
      v_head := v_pool(v_head).nxt;
      return r;
    end function;
  end protected body;
  shared variable sv : t_fifo;
begin
  process(wr)
  begin
    if wr'event and wr = '1' then
      sv.push(10);
      sv.push(20);
      data <= sv.pop;
    end if;
  end process;
end architecture rtl;
