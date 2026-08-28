-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SMN_2
-- Related Rule ID: SEM_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::=
--   subprogram_declaration |
--   subprogram_instantiation_declaration |
--   attribute_specification |
--   use_clause
-- Test Focus: SEMANTIC — attribute_specification references
--   a name that is not declared in the protected type.
--   The attribute spec targets 'clear', but only 'set' and
--   'get' are declared. This creates an unresolved reference.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — undefined name
-- =============================================================
entity pt_decl_di_sem_bad_attr_ref is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_di_sem_bad_attr_ref;

architecture rtl of pt_decl_di_sem_bad_attr_ref is
  type t_pt is protected
    procedure set(x : integer);
    impure function get return integer;
    attribute info : string;
    attribute info of clear : procedure is "clearer"; -- ERROR: 'clear' not declared
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
    impure function get return integer is begin return v; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(42); val <= sv.get;
    end if;
  end process;
end architecture rtl;
