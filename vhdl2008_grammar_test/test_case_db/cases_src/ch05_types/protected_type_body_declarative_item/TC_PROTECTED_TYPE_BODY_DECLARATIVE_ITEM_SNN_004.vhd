-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SNN_004
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
-- Test Focus: ERROR — subprogram_declaration (only, without body)
--   of a method that is not in the type declaration. A
--   subprogram_declaration is valid as a body declarative item
--   only for helper subprograms internal to the body, but here
--   it conflicts because the method is not declared in the type.
--   Actually tests: a subprogram_declaration in the body that
--   re-declares a method with a conflicting return type versus
--   the protected type declaration.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — return type conflict
-- =============================================================
entity pt_body_di_snn_redeclare is
  port (
    clk : in  bit;
    val : out bit_vector(7 downto 0)
  );
end entity pt_body_di_snn_redeclare;

architecture rtl of pt_body_di_snn_redeclare is
  type t_pt is protected
    impure function get return integer;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    -- ERROR: subprogram_declaration re-declaring 'get' with
    -- different return type conflicts with type declaration
    impure function get return bit_vector(7 downto 0) is
    begin
      return "00000000";
    end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      val <= "00000000";
    end if;
  end process;
end architecture rtl;
