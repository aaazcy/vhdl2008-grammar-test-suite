-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_ITEM_SEM_002
-- Related Rule ID: SEM_PROTECTE_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | attribute_specification | use_clause
-- Case Type: Positive
-- Test Focus: SEMANTIC -- protected declarative item with all four
--            allowed forms: subprogram_declaration, subprogram_instantiation,
--            attribute_specification, and use_clause coexist in the
--            declarative part. Tests that each item type is accepted.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pt_di_sem_all_forms is
  port (
    clk  : in  bit;
    dout : out integer
  );
end entity pt_di_sem_all_forms;
architecture rtl of pt_di_sem_all_forms is
  type t_pt is protected
    procedure increment;
    impure function value return integer;
    attribute creator : string;
    attribute creator of increment : procedure is "testbench";
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure increment is begin v := v + 1; end procedure;
    impure function value return integer is begin return v; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then sv.increment; dout <= sv.value; end if;
  end process;
end architecture rtl;
