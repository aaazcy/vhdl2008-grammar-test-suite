-- =============================================================
-- Case ID: TC_PROCESS_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PROCESS_VARIABLE_STATE
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Variables declared in process_declarative_part retain their values across successive process invocations — unlike signals which are scheduled, variable assignment takes effect immediately within the same execution cycle so the updated value is visible to subsequent statements
-- Case Type: Positive
-- Error Category: none
-- Test Focus: Variable state retention across process activations — variable v_acc accumulates a running sum on each rising clock edge, and its value after accumulation drives the sum output, verifying that process variables preserve state between invocations and variable assignments take immediate effect for use by downstream statements in the same cycle
-- Expected Result: Compiles successfully; v_acc retains its value across clock cycles
-- Dependencies: None
-- =============================================================
entity proc_sem1_ent is
  port(clk, rst_n : in bit; val : in integer; sum : out integer);
end entity proc_sem1_ent;
architecture bh of proc_sem1_ent is
begin
  process(clk, rst_n) is
    variable v_acc : integer := 0;
  begin
    if rst_n = '0' then
      v_acc := 0;
      sum <= 0;
    elsif clk'event and clk = '1' then
      v_acc := v_acc + val;
      sum <= v_acc;
    end if;
  end process;
end architecture bh;
