-- =============================================================
-- Case ID: TC_SEM_SEQ_001_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_001
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Rule Description: Target of a signal assignment must be a signal (not a variable, constant, or port of mode IN)
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: variable assignment using <=
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity sem_seq_001_smn2 is port(r:out integer); end entity;
architecture bh of sem_seq_001_smn2 is
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