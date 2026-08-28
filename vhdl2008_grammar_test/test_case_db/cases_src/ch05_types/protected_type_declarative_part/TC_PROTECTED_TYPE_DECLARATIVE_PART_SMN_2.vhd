-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SMN_2
-- Related Rule ID: SEM_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: SEMANTIC — attribute_specification targets a
--   label/name that is not a declared subprogram in the type.
--   The spec references 'bogus' which is not declared.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — unresolved reference
-- =============================================================
entity pt_decl_dp_sem_bad_attr is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_dp_sem_bad_attr;

architecture rtl of pt_decl_dp_sem_bad_attr is
  type t_pt is protected
    procedure store(d : integer);
    impure function fetch return integer;
    attribute magic : string;
    attribute magic of bogus : procedure is "nope"; -- ERROR: 'bogus' not declared
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure store(d : integer) is begin v := d; end procedure;
    impure function fetch return integer is begin return v; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.store(99); val <= sv.fetch;
    end if;
  end process;
end architecture rtl;
