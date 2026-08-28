-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_013
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: Condition in wait until must be convertible to BOOLEAN — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: wait until uses an integer literal as the condition — in wait until 7 the condition is of integer type and cannot be converted to boolean
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity wait_int_cond_ent is
  port (go : out bit);
end entity wait_int_cond_ent;

architecture smn of wait_int_cond_ent is
begin
  process is
  begin
    go <= '0';
    wait until 7;
    go <= '1';
    wait;
  end process;
end architecture smn;
