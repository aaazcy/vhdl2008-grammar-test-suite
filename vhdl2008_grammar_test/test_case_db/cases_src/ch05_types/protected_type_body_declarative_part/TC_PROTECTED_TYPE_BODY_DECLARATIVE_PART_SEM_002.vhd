-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SEM_002
-- Related Rule ID: SEM_PROTECTE_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::= { protected_type_body_declarative_item }
-- Case Type: Positive
-- Test Focus: SEMANTIC — protected body declarative part contains
--            type_declaration, constant_declaration, and variable_declaration.
--            All items in the declarative part are properly elaborated and
--            used by the method bodies. Tests that multiple declarative items
--            coexist correctly within the protected body scope.
-- Expected Result: Compiles and runs successfully
-- Dependencies: None
-- =============================================================
entity pt_body_dp_sem_multi_items is
  port (
    clk   : in  bit;
    dout  : out integer
  );
end entity pt_body_dp_sem_multi_items;
architecture rtl of pt_body_dp_sem_multi_items is
  type t_buf is protected
    procedure write(d : integer);
    impure function read return integer;
  end protected;
  type t_buf is protected body
    constant C_MAX : integer := 255;
    type t_arr is array (0 to 7) of integer;
    variable v_buf : t_arr := (others => 0);
    variable v_ptr : integer range 0 to 7 := 0;
    procedure write(d : integer) is
    begin
      if d <= C_MAX then v_buf(v_ptr) := d; v_ptr := (v_ptr + 1) mod 8; end if;
    end procedure;
    impure function read return integer is
    begin
      return v_buf((v_ptr - 1) mod 8);
    end function;
  end protected body;
  shared variable sv : t_buf;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then sv.write(42); dout <= sv.read; end if;
  end process;
end architecture rtl;
