-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SMN_2
-- Related Rule ID: SEM_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_definition ::=
--   protected_type_declaration | protected_type_body
-- Test Focus: SEMANTIC — protected type declaration declares
--   a method with one parameter mode but body implements it
--   with a different mode. The declaration uses 'in' mode
--   for parameter 'x' but body declares 'out' mode.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — mode mismatch
-- =============================================================
entity pt_def_sem_mode_mismatch is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_def_sem_mode_mismatch;

architecture rtl of pt_def_sem_mode_mismatch is
  type t_err is protected
    procedure store(x : in integer);
    impure function fetch return integer;
  end protected;
  type t_err is protected body
    variable v : integer := 0;
    procedure store(x : out integer) is          -- ERROR: mode 'out' != declaration's 'in'
    begin
      x := v;
    end procedure;
    impure function fetch return integer is
    begin return v; end function;
  end protected body;
  shared variable sv : t_err;
begin
  process(clk)
    variable tmp : integer := 0;
  begin
    if clk'event and clk = '1' then
      sv.store(tmp);
      val <= sv.fetch;
    end if;
  end process;
end architecture rtl;
