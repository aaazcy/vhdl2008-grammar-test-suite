-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: Declarative item — multiple attribute_specification
--   items interleaved with subprogram declarations. Tests
--   that attribute specs and subprogram decls freely mix.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_di_multi_attr is
  port (
    gate : in  bit;
    rdy  : out bit
  );
end entity pt_decl_di_multi_attr;

architecture rtl of pt_decl_di_multi_attr is
  attribute keep_hierarchy : string;
  type t_gate is protected
    procedure enable;
    procedure disable;
    impure function is_open return bit;
    attribute keep_hierarchy of enable  : procedure is "soft";
    attribute keep_hierarchy of disable : procedure is "soft";
    attribute keep_hierarchy of is_open : function is "soft";
  end protected;
  type t_gate is protected body
    variable v_open : bit := '0';
    procedure enable is begin v_open := '1'; end procedure;
    procedure disable is begin v_open := '0'; end procedure;
    impure function is_open return bit is begin return v_open; end function;
  end protected body;
  shared variable sv : t_gate;
begin
  process(gate)
  begin
    if gate'event and gate = '1' then
      sv.enable;
      rdy <= sv.is_open;
    end if;
  end process;
end architecture rtl;
