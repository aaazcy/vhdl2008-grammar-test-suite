-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SYN_001
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
-- Test Focus: Body declarative item — subprogram_body: a
--   procedure implementation inside the body declarative part
--   that calls a body-side variable.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_subprog_body is
  port (
    clk : in  bit;
    cnt : out natural
  );
end entity pt_body_di_subprog_body;

architecture rtl of pt_body_di_subprog_body is
  type t_cnt is protected
    impure function read return natural;
  end protected;
  type t_cnt is protected body
    variable v : natural := 0;
    procedure bump is
    begin
      v := v + 1;
    end procedure;
    impure function read return natural is
    begin
      bump;
      return v;
    end function;
  end protected body;
  shared variable sv : t_cnt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      cnt <= sv.read;
    end if;
  end process;
end architecture rtl;
