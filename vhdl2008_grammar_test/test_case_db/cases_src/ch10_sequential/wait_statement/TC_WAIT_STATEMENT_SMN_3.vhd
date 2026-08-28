-- =============================================================
-- Case ID: TC_WAIT_STATEMENT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_013
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: Condition in wait until must be a BOOLEAN expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: wait until uses an integer expression instead of BOOLEAN — violates SEM_SEQ_013
-- Expected Result: Triggers semantic error: condition in wait until must be BOOLEAN
-- Dependencies: None
-- =============================================================
entity wait_int_cond_ent is
  port (counter : in integer; timeout : out boolean);
end entity wait_int_cond_ent;

architecture sem of wait_int_cond_ent is
begin
  process is
  begin
    timeout <= false;
    wait until counter;  -- ERROR: counter is integer, not BOOLEAN
    timeout <= true;
    wait;
  end process;
end architecture sem;
