-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SEM_002
-- Related Rule ID: SEM_RANGE_CO_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Case Type: Positive
-- Test Focus: SEMANTIC -- range_constraint applied to subtype
--            declaration narrowing an integer base type to a specific
--            range. Tests that the range constraint is properly
--            enforced on signal assignments within the constrained range.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity range_con_sem_subtype is
  port (
    dout : out integer
  );
end entity range_con_sem_subtype;
architecture rtl of range_con_sem_subtype is
  subtype t_addr is integer range 0 to 1023;
  subtype t_byte is integer range 0 to 255;
  signal s_addr : t_addr := 0;
  signal s_data : t_byte := 0;
begin
  process
  begin
    s_addr <= 512;
    s_data <= 128;
    dout <= s_addr + s_data;
    wait;
  end process;
end architecture rtl;
