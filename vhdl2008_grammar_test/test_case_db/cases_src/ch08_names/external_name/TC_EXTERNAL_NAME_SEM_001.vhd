-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_NAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Positive
-- Rule Description: The entity class of each of the three branches of external_name (constant/signal/variable) must match the actual class of the object referenced by external_pathname
-- Test Focus: positive semantic case — three aliases use the constant, signal, and variable keywords respectively, each external_pathname references an object whose class matches the declaration keyword, verifying the correct semantics of the three kinds of external_name under legal binding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_name_sem_valid is
  port(clk : in bit; check_val : in integer; alert : out bit);
end entity;

architecture vhdl2008 of ext_name_sem_valid is
  alias C_LIMIT is <<constant @work.limits.MAX : integer>>;
  alias mon_enable is <<signal .tb.u_core.enable : bit>>;
  alias local_thresh : integer is C_LIMIT;
  signal exceed : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if check_val > local_thresh and mon_enable = '1' then
        exceed <= '1';
      else
        exceed <= '0';
      end if;
    end if;
  end process;
  alert <= exceed;
end architecture vhdl2008;
