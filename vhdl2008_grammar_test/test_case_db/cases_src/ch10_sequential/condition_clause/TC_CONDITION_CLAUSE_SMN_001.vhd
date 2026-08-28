-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_COND_CLAUSE_MISMATCH
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: Condition clause condition must be boolean
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: until condition comparing integer with bit
-- Expected Result: Triggers semantic error: comparison type mismatch
-- Dependencies: None
-- =============================================================
entity cond_clause_smn1_ent is port(y:out integer); end entity;
architecture bh of cond_clause_smn1_ent is
  signal s_int:integer:=0;
begin
  process is
  begin
    wait until s_int='1';
    y<=s_int;
  end process;
end architecture bh;
