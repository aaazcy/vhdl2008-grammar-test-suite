-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SEM_002
-- Related Rule ID: SEM_PHYSICAL_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Positive
-- Test Focus: SEMANTIC -- physical literal with explicit numeric value
--            and unit_name used in arithmetic operations. Tests that
--            physical literals like 10 ns, 5.5 us participate correctly
--            in multiplication and type conversion. Verifies unit scaling.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_lit_sem_time_calc is
  port (
    dout : out integer
  );
end entity phys_lit_sem_time_calc;
architecture rtl of phys_lit_sem_time_calc is
  constant C_DELAY_NS : time := 10 ns;
  constant C_PERIOD   : time := 100 ns;
  constant C_CYCLES    : integer := 5;
  signal s_result : integer := 0;
begin
  process
    variable v_total : time;
  begin
    v_total := C_PERIOD * C_CYCLES;
    s_result <= v_total / C_DELAY_NS;
    dout <= s_result;
    wait;
  end process;
end architecture rtl;
