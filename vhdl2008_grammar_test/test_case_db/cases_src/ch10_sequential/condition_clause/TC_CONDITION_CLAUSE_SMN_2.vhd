-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_COND_CLAUSE_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: The condition in an until clause must be of type boolean
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: until clause with integer expression instead of boolean
-- Expected Result: Triggers semantic error: condition must be boolean
-- Dependencies: None
-- =============================================================
entity cond_clause_sem1_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of cond_clause_sem1_ent is
  signal s_val:integer:=0;
begin
  process is
  begin
    wait until s_val;
    y<=s_val;
  end process;
end architecture bh;
