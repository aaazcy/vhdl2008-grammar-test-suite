-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SEM_002
-- Related Rule ID: SEM_PROTECTE_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration
-- Case Type: Positive
-- Test Focus: SEMANTIC -- protected body declarative items with
--            constant_declaration, type_declaration, and variable_declaration
--            all coexisting and used by the method bodies. Tests that
--            the full range of body declarative items works correctly.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pt_bdi_sem_multi is
  port (
    clk  : in  bit;
    dout : out integer
  );
end entity pt_bdi_sem_multi;
architecture rtl of pt_bdi_sem_multi is
  type t_fifo is protected
    procedure push(d : integer);
    impure function pop return integer;
    impure function count return integer;
  end protected;
  type t_fifo is protected body
    constant DEPTH : integer := 8;
    type t_mem is array (0 to DEPTH - 1) of integer;
    variable v_mem : t_mem;
    variable v_wr  : integer range 0 to DEPTH - 1 := 0;
    variable v_rd  : integer range 0 to DEPTH - 1 := 0;
    variable v_cnt : integer range 0 to DEPTH := 0;
    procedure push(d : integer) is
    begin
      if v_cnt < DEPTH then v_mem(v_wr) := d; v_wr := (v_wr + 1) mod DEPTH; v_cnt := v_cnt + 1; end if;
    end procedure;
    impure function pop return integer is
      variable r : integer;
    begin
      if v_cnt > 0 then r := v_mem(v_rd); v_rd := (v_rd + 1) mod DEPTH; v_cnt := v_cnt - 1; return r; end if;
      return 0;
    end function;
    impure function count return integer is begin return v_cnt; end function;
  end protected body;
  shared variable sv : t_fifo;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then sv.push(42); dout <= sv.count; end if;
  end process;
end architecture rtl;
