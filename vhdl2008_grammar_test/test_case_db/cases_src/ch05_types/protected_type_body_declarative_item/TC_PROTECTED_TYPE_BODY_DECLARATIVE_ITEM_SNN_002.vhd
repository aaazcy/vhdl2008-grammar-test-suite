-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SNN_002
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
-- Test Focus: ERROR — shared variable declaration is NOT a valid
--   body declarative item. Shared variables are not in the
--   BNF alternation for protected body items.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_body_di_snn_shared_var is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_di_snn_shared_var;

architecture rtl of pt_body_di_snn_shared_var is
  type t_pt is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_pt is protected body
    shared variable v_bad : integer := 0;      -- ERROR: shared variable not in body declarative item BNF
    procedure inc is begin v_bad := v_bad + 1; end procedure;
    impure function get return integer is begin return v_bad; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.inc; val <= sv.get;
    end if;
  end process;
end architecture rtl;
