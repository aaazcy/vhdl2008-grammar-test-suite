-- =============================================================
-- Case ID: TC_SEM_SEQ_018_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_018
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Rule Description: RETURN statement in a procedure must not contain an expression
-- Case Type: Negative
-- Error Category: interface_violation
-- Test Focus: reading from output port
-- Expected Result: Triggers semantic error: interface_violation
-- Dependencies: None
-- =============================================================
entity sem_seq_018_smn2 is port(a:in bit; b:out bit); end entity;
architecture bh of sem_seq_018_smn2 is
  signal s_tmp:bit:='0';
begin
  -- ERROR: cannot read OUT port (pre-2008)
  s_tmp <= b;
  a <= s_tmp;
end architecture bh;