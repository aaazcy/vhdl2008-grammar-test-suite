-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_022
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Rule Description: Condition in exit when must be convertible to BOOLEAN — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: exit when uses an integer literal as the condition - in exit when 5 the condition is integer type, not convertible to boolean
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity exit_int_cond_ent is
  port (result : out bit);
end entity exit_int_cond_ent;

architecture smn of exit_int_cond_ent is
begin
  process is
  begin
    loop
      exit when 5;
    end loop;
    result <= '0';
  end process;
end architecture smn;
