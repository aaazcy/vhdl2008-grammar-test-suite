-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_019
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Rule Description: loop_label in next must reference an enclosing loop — negative variant
-- Case Type: Negative
-- Error Category: scope_error
-- Test Focus: SMN: next references a constant name instead of a loop_label — loop_label must be a label, not a constant identifier
-- Expected Result: Triggers semantic error: identifier not a loop label
-- Dependencies: None
-- =============================================================
entity next_const_label_ent is
  port (clk : in bit; status : out integer);
end entity next_const_label_ent;

architecture smn of next_const_label_ent is
  constant C_MAX : integer := 100;
begin
  process(clk) is
    variable v_cnt : integer := 0;
  begin
    test: loop
      v_cnt := v_cnt + 1;
      next C_MAX when v_cnt > 10;  -- ERROR: C_MAX is a constant, not a loop label
    end loop test;
    status <= v_cnt;
  end process;
end architecture smn;
