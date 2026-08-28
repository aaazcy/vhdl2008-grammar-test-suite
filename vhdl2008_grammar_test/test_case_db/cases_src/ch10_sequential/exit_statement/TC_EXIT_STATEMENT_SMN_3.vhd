-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_022
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Rule Description: Condition in exit when must be a BOOLEAN expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: condition of exit when uses an integer expression instead of BOOLEAN - violates SEM_SEQ_022
-- Expected Result: Triggers semantic error: condition must be BOOLEAN
-- Dependencies: None
-- =============================================================
entity exit_cond_type_ent is
  port (val : in integer; limit : out integer);
end entity exit_cond_type_ent;

architecture sem of exit_cond_type_ent is
begin
  process(val) is
    variable v_i : integer := 0;
  begin
    loop
      v_i := v_i + 1;
      exit when v_i;  -- ERROR: v_i is integer, not BOOLEAN
    end loop;
    limit <= v_i;
  end process;
end architecture sem;
