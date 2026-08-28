-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_SENS_CLAUSE_SIGNAL
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Negative
-- Test Focus: SMN: a constant used in the sensitivity_list instead of a signal — `wait on c_const`, c_const is a constant rather than a signal
-- Expected Result: Triggers semantic error: item in sensitivity list must be a signal
-- Dependencies: None
-- =============================================================
entity sc_smn2_ent is port(y:out integer); end entity;
architecture bh of sc_smn2_ent is
  constant c_const : bit := '0';
begin
  process is
  begin
    wait on c_const;
    y <= 1;
  end process;
end architecture bh;
