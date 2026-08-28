-- =============================================================
-- Case ID: TC_SEM_SUBP_002_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_002
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Rule Description: A pure function must not reference or modify any signals or variables declared outside the function
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: signal assignment to constant
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity sem_subp_002_smn1 is port(r:out integer); end entity;
architecture bh of sem_subp_002_smn1 is
  constant C_VAL:bit:='0';
begin
  -- ERROR: cannot assign to constant
  C_VAL <= '1';
  r <= 0;
end architecture bh;