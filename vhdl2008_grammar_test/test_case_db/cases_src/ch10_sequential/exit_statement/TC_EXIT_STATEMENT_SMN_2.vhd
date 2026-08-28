-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_020
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Rule Description: loop_label in exit must reference an enclosing loop
-- Case Type: Negative
-- Error Category: scope_error
-- Test Focus: SEM: exit references the nonexistent loop_label "not_exist" - loop_label must reference an enclosing loop that exists in the current scope
-- Expected Result: Triggers semantic error: loop_label does not reference an enclosing loop
-- Dependencies: None
-- =============================================================
entity exit_bad_label_ent is
  port (a : in integer; b : out integer);
end entity exit_bad_label_ent;

architecture sem of exit_bad_label_ent is
begin
  process(a) is
    variable v_i : integer := 0;
  begin
    my_loop: loop
      v_i := v_i + 1;
      exit not_exist when v_i > 5;  -- ERROR: 'not_exist' not a valid enclosing loop
    end loop my_loop;
    b <= v_i;
  end process;
end architecture sem;
