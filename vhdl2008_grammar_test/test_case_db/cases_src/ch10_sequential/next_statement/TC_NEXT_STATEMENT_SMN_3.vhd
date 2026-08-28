-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_021
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Rule Description: Condition in next when must be a BOOLEAN expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: the condition of next when uses an integer expression instead of BOOLEAN — violating SEM_SEQ_021
-- Expected Result: Triggers semantic error: condition must be BOOLEAN
-- Dependencies: None
-- =============================================================
entity next_cond_type_ent is
  port (val : in integer; limit : out integer);
end entity next_cond_type_ent;

architecture sem of next_cond_type_ent is
begin
  process(val) is
    variable v_i : integer := 0;
  begin
    loop
      v_i := v_i + 1;
      next when v_i;  -- ERROR: v_i is integer, not BOOLEAN
    end loop;
    limit <= v_i;
  end process;
end architecture sem;
