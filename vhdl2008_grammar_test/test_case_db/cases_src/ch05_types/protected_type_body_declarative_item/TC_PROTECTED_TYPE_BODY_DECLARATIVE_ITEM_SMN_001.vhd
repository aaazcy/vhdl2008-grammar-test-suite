-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SMN_001
-- Related Rule ID: SMN_PROTECTE_001
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
-- Test Focus: SEMANTIC NEGATIVE — variable declaration in body
--   uses an identifier already claimed by a formal parameter
--   name in a method declaration. Name hiding causes a method
--   to reference wrong entity.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — ambiguous reference
-- =============================================================
entity pt_body_di_smn_hiding is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_di_smn_hiding;

architecture rtl of pt_body_di_smn_hiding is
  type t_pt is protected
    procedure store(v : integer);
    impure function fetch return integer;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;                 -- same name as formal parameter of store
    procedure store(v : integer) is
    begin
      v := v;                                  -- ambiguous: which v is referenced?
    end procedure;
    impure function fetch return integer is
    begin
      return v;
    end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.store(42);
      val <= sv.fetch;
    end if;
  end process;
end architecture rtl;
