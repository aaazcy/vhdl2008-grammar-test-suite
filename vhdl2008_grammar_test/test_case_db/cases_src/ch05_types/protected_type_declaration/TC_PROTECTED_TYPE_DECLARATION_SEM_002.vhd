-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SEM_002
-- Related Rule ID: SEM_PROTECTE_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::= protected protected_type_declarative_part end protected [ protected_type_simple_name ]
-- Case Type: Positive
-- Test Focus: SEMANTIC -- protected type declaration with both procedure
--            and function methods, including an impure function that
--            accesses internal state. Tests that the declaration
--            interface correctly specifies all method signatures so
--            the matching body can implement them.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pt_decl_sem_multi_method is
  port (
    clk  : in  bit;
    dout : out integer
  );
end entity pt_decl_sem_multi_method;
architecture rtl of pt_decl_sem_multi_method is
  type t_stack is protected
    procedure push(x : integer);
    impure function pop return integer;
    impure function depth return integer;
  end protected;
  type t_stack is protected body
    type t_arr is array (0 to 15) of integer;
    variable v_data : t_arr;
    variable v_sp   : integer range 0 to 15 := 0;
    procedure push(x : integer) is begin v_data(v_sp) := x; v_sp := v_sp + 1; end procedure;
    impure function pop return integer is begin v_sp := v_sp - 1; return v_data(v_sp); end function;
    impure function depth return integer is begin return v_sp; end function;
  end protected body;
  shared variable sv : t_stack;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then sv.push(10); dout <= sv.depth; end if;
  end process;
end architecture rtl;
