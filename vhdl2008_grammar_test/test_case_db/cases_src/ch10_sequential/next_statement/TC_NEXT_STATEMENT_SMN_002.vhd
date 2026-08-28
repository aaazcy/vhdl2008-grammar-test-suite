-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_021
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Rule Description: Condition in next when must be convertible to BOOLEAN — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: next when uses an integer literal as condition — in next when 5 the condition is of integer type and cannot be converted to boolean
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity next_int_cond_ent is
  port (result : out bit);
end entity next_int_cond_ent;

architecture smn of next_int_cond_ent is
begin
  process is
    variable v_i : integer := 0;
  begin
    loop
      v_i := v_i + 1;
      next when 5;
    end loop;
    result <= '0';
  end process;
end architecture smn;
