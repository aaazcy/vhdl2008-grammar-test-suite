-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SEM_002
-- Related Rule ID: SEM_PROTECTE_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::= protected_type_declaration | protected_type_body
-- Case Type: Positive
-- Test Focus: SEMANTIC -- complete protected_type_definition pairing a
--            declaration and body that together form a semaphore.
--            Tests the full definition with wait/signal-based mutual
--            exclusion pattern implemented via protected method calls.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pt_def_sem_semaphore is
  port (
    clk  : in  bit;
    dout : out integer
  );
end entity pt_def_sem_semaphore;
architecture rtl of pt_def_sem_semaphore is
  type t_semaphore is protected
    procedure acquire;
    procedure unlock;
    impure function is_locked return boolean;
  end protected;
  type t_semaphore is protected body
    variable v_locked : boolean := false;
    procedure acquire is begin v_locked := true; end procedure;
    procedure unlock is begin v_locked := false; end procedure;
    impure function is_locked return boolean is begin return v_locked; end function;
  end protected body;
  shared variable sv_sem : t_semaphore;
  signal s_count : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if not sv_sem.is_locked then
        sv_sem.acquire;
        s_count <= s_count + 1;
        sv_sem.unlock;
      end if;
      dout <= s_count;
    end if;
  end process;
end architecture rtl;
