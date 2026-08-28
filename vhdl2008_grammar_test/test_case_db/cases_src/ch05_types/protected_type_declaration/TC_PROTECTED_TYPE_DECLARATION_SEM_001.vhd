-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SEM_001
-- Related Rule ID: SEM_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: SEMANTIC — two methods declared with the same
--   name but different parameter profiles (overloading).
--   While VHDL allows subprogram overloading in general,
--   protected type methods within the same type must have
--   unique names — the declaration with two same-named
--   methods causes ambiguity.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — ambiguous method name
-- =============================================================
entity pt_decl_sem_dup_method is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_sem_dup_method;

architecture rtl of pt_decl_sem_dup_method is
  type t_pt is protected
    procedure update(x : integer);
    procedure update(x : real);                -- ERROR: duplicate method name may be ambiguous
    impure function result return integer;
  end protected;
  type t_pt is protected body
    variable v : integer := 0;
    procedure update(x : integer) is begin v := x; end procedure;
    procedure update(x : real) is begin v := integer(x); end procedure;
    impure function result return integer is begin return v; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.update(42);
      val <= sv.result;
    end if;
  end process;
end architecture rtl;
