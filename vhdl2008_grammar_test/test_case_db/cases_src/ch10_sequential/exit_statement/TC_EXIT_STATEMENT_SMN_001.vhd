-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_020
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Rule Description: loop_label in exit must reference an enclosing loop — negative variant
-- Case Type: Negative
-- Error Category: scope_error
-- Test Focus: SMN: exit references a signal name instead of a loop_label - loop_label must be a label, not a signal/variable identifier
-- Expected Result: Triggers semantic error: identifier not a loop label
-- Dependencies: None
-- =============================================================
entity exit_signal_label_ent is
  port (clk : in bit; status : out integer);
end entity exit_signal_label_ent;

architecture smn of exit_signal_label_ent is
  signal s_flag : integer := 0;
begin
  process(clk) is
    variable v_cnt : integer := 0;
  begin
    test: loop
      v_cnt := v_cnt + 1;
      exit s_flag when v_cnt > 10;  -- ERROR: s_flag is a signal, not a loop label
    end loop test;
    status <= v_cnt;
  end process;
end architecture smn;
