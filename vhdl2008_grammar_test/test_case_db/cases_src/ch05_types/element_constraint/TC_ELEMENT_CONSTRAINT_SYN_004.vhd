-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Positive
-- Test Focus: element_constraint with record_constraint where
--            record fields themselves have array_constraint.
--            A timer/counter bank with constrained period and
--            compare values.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity timer_counter_bank is
  port (
    clk      : in  bit;
    timer_id : in  integer range 0 to 3;
    reload   : in  integer range 0 to 65535;
    compare  : in  integer range 0 to 65535;
    current  : out integer range 0 to 65535
  );
end entity timer_counter_bank;

architecture rtl of timer_counter_bank is
  type timer_reg is record
    count_val   : integer range 0 to 65535;
    reload_val  : integer range 0 to 65535;
    cmp_val     : integer range 0 to 65535;
    running     : boolean;
  end record;
  type timer_array is array (0 to 3) of timer_reg;
  signal timers : timer_array := (others =>
    (count_val => 0, reload_val => 0, cmp_val => 0, running => false));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      timers(timer_id).reload_val <= reload;
      timers(timer_id).cmp_val    <= compare;
      current <= timers(timer_id).count_val;
    end if;
  end process;
end architecture rtl;
