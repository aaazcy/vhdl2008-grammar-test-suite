-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SEM_001
-- Related Rule ID: SEM_PROTECTE_001
-- Rule Type: Semantic
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
-- Test Focus: SEMANTIC — protected type body declarative items
--   (variable_declaration and subprogram bodies) working together:
--   body-side variable v_val is updated by method link and read
--   back by impure function get, verifying that protected_type_body
--   declarative items elaborate and execute correctly.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_sem_forward is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_di_sem_forward;

architecture rtl of pt_body_di_sem_forward is
  type t_outer is protected
    procedure link(n : integer);
    impure function get return integer;
  end protected;
  type t_outer is protected body
    variable v_val : integer := 0;
    procedure link(n : integer) is
    begin
      v_val := n;
    end procedure;
    impure function get return integer is
    begin
      return v_val;
    end function;
  end protected body;
  shared variable sv : t_outer;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.link(5);
      val <= sv.get;
    end if;
  end process;
end architecture rtl;
