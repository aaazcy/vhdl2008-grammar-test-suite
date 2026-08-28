-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_019
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Rule Description: loop_label in next must reference an enclosing loop
-- Case Type: Negative
-- Error Category: scope_error
-- Test Focus: SEM: next references nonexistent loop_label "ghost_loop" — loop_label must reference an enclosing loop that exists in the current scope
-- Expected Result: Triggers semantic error: loop_label does not reference an enclosing loop
-- Dependencies: None
-- =============================================================
entity next_bad_label_ent is
  port (a : in integer; b : out integer);
end entity next_bad_label_ent;

architecture sem of next_bad_label_ent is
begin
  process(a) is
    variable v_i : integer := 0;
  begin
    my_loop: loop
      v_i := v_i + 1;
      next ghost_loop when v_i > 5;  -- ERROR: 'ghost_loop' not a valid enclosing loop
    end loop my_loop;
    b <= v_i;
  end process;
end architecture sem;
