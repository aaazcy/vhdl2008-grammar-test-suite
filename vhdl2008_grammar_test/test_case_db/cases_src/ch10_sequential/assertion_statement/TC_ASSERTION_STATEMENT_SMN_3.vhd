-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_015
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Report expression in assertion must be of type STRING
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: report expression uses bit_vector instead of STRING - violates SEM_SEQ_015
-- Expected Result: Triggers semantic error: report expression must be STRING
-- Dependencies: None
-- =============================================================
entity assert_stmt_sem2_ent is
  port (gate : in boolean; result : out boolean);
end entity assert_stmt_sem2_ent;

architecture sem of assert_stmt_sem2_ent is
  constant C_MSG : bit_vector(7 downto 0) := "01000101";
begin
  process(gate) is
  begin
    assert gate report C_MSG severity note;  -- ERROR: C_MSG is bit_vector, not STRING
    result <= gate;
  end process;
end architecture sem;
