-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SNN_001
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
-- Test Focus: ERROR — signal_declaration is NOT a valid body
--   declarative item. Signals cannot appear inside a protected
--   body declarative part per the BNF alternation.
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- =============================================================
entity pt_body_di_snn_signal is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_di_snn_signal;

architecture rtl of pt_body_di_snn_signal is
  type t_pt is protected
    procedure inc;
    impure function get return integer;
  end protected;
  type t_pt is protected body
    signal s_bad : bit := '0';                 -- ERROR: signal not a valid body declarative item
    variable v : integer := 0;
    procedure inc is begin v := v + 1; end procedure;
    impure function get return integer is begin return v; end function;
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
