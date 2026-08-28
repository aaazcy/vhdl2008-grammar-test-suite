-- =============================================================
-- Case ID: TC_SEM_SEQ_023_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_023
-- Standard Reference: IEEE 1076-2008 Section 10.4
-- Rule Description: Number of actual parameters in procedure call must match the number of formal parameters
-- Case Type: Negative
-- Error Category: interface_violation
-- Test Focus: reading from output port
-- Expected Result: Triggers semantic error: interface_violation
-- Dependencies: None
-- =============================================================
entity sem_seq_023_smn2 is port(a:in bit; b:out bit); end entity;
architecture bh of sem_seq_023_smn2 is
  signal s_tmp:bit:='0';
begin
  -- ERROR: cannot read OUT port (pre-2008)
  s_tmp <= b;
  a <= s_tmp;
end architecture bh;