-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SYN_006
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
-- Test Focus: Body declarative item — variable_declaration with
--   initial value expression using a body-side constant.
--   Combines constant + variable with init expression in body
--   declarative part before method bodies.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_var_init is
  port (
    load  : in  bit;
    value : out integer
  );
end entity pt_body_di_var_init;

architecture rtl of pt_body_di_var_init is
  type t_latch is protected
    procedure capture(d : integer);
    impure function held return integer;
  end protected;
  type t_latch is protected body
    constant C_DEFAULT : integer := -1;
    variable v_data : integer := C_DEFAULT;
    procedure capture(d : integer) is
    begin
      v_data := d;
    end procedure;
    impure function held return integer is
    begin
      return v_data;
    end function;
  end protected body;
  shared variable sv : t_latch;
begin
  process(load)
  begin
    if load'event and load = '1' then
      sv.capture(88);
    end if;
  end process;
  value <= sv.held;
end architecture rtl;
