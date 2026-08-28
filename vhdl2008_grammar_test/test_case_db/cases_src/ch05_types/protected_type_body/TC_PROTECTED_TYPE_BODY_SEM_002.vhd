-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SEM_002
-- Related Rule ID: SEM_PROTECTE_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::= protected body protected_type_body_declarative_part end protected body [ protected_type_simple_name ]
-- Case Type: Positive
-- Test Focus: SEMANTIC — protected body implements shared counter with
--            concurrent access. Two processes increment the same protected
--            shared variable. Tests mutual exclusion semantics where the
--            protected body guarantees atomic method execution so no
--            updates are lost across concurrent callers.
-- Expected Result: Compiles successfully, both processes execute atomically
-- Dependencies: None
-- =============================================================
entity pt_body_sem_shared_counter is
  port (
    clk   : in  bit;
    count : out integer
  );
end entity pt_body_sem_shared_counter;

architecture rtl of pt_body_sem_shared_counter is
  type t_counter is protected
    procedure increment;
    impure function value return integer;
  end protected;
  type t_counter is protected body
    variable v_cnt : integer := 0;
    procedure increment is
    begin
      v_cnt := v_cnt + 1;
    end procedure;
    impure function value return integer is
    begin
      return v_cnt;
    end function;
  end protected body;
  shared variable sv_ctr : t_counter;
  signal s_clk_a, s_clk_b : bit := '0';
begin
  proc_a : process(clk)
  begin
    if clk'event and clk = '1' then
      sv_ctr.increment;
    end if;
  end process;
  proc_b : process(clk)
  begin
    if clk'event and clk = '1' then
      count <= sv_ctr.value;
    end if;
  end process;
end architecture rtl;
