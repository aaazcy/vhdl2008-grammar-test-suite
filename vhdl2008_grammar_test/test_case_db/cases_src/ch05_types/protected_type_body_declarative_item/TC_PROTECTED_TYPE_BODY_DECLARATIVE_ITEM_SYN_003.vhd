-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SYN_003
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
-- Test Focus: Body declarative item — constant_declaration
--   and subtype_declaration used together inside protected body.
--   Constants define thresholds used by body methods.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_const_subtype is
  port (
    tick  : in  bit;
    alert : out bit
  );
end entity pt_body_di_const_subtype;

architecture rtl of pt_body_di_const_subtype is
  type t_watchdog is protected
    procedure kick;
    impure function expired return bit;
  end protected;
  type t_watchdog is protected body
    constant C_LIMIT  : natural := 255;
    subtype t_count is natural range 0 to C_LIMIT;
    variable v_cnt : t_count := 0;
    procedure kick is
    begin
      v_cnt := 0;
    end procedure;
    impure function expired return bit is
    begin
      if v_cnt >= C_LIMIT then
        return '1';
      else
        v_cnt := v_cnt + 1;
        return '0';
      end if;
    end function;
  end protected body;
  shared variable sv : t_watchdog;
begin
  process(tick)
  begin
    if tick'event and tick = '1' then
      sv.kick;
    end if;
  end process;
  alert <= sv.expired;
end architecture rtl;
