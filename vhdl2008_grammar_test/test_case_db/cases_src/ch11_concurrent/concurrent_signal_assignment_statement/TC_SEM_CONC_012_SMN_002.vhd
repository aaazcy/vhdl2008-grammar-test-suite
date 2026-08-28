-- =============================================================
-- Case ID: TC_SEM_CONC_012_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONC_012
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: Target of a concurrent signal assignment must be a signal
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: variable assignment using <=
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity sem_conc_012_smn2 is port(r:out integer); end entity;
architecture bh of sem_conc_012_smn2 is
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