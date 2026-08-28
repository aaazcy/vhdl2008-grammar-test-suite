-- =============================================================
-- Case ID: TC_SEM_SUBP_002_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_002
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Rule Description: A pure function must not reference or modify any signals or variables declared outside the function
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: variable assignment using <=
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity sem_subp_002_smn2 is port(r:out integer); end entity;
architecture bh of sem_subp_002_smn2 is
  signal s_sig:bit:='0';
begin
  process
    variable v_var:integer:=0;
  begin
    -- ERROR: variable assignment uses := not <=
    v_var <= 42;
    r <= v_var; wait;
  end process;
end architecture bh;