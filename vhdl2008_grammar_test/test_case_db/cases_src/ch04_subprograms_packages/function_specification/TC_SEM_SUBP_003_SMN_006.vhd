-- =============================================================
-- Case ID: TC_SEM_SUBP_003_SMN_006
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_003
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Rule Description: Function formal parameters of mode OUT or INOUT are not permitted (only IN allowed)
-- Case Type: Negative
-- Error Category: interface_violation
-- Test Focus: reading from output port
-- Expected Result: Triggers semantic error: interface_violation
-- Dependencies: None
-- =============================================================
entity sem_subp_003_smn2 is port(a:in bit; b:out bit); end entity;
architecture bh of sem_subp_003_smn2 is
  signal s_tmp:bit:='0';
begin
  -- ERROR: cannot read OUT port (pre-2008)
  s_tmp <= b;
  a <= s_tmp;
end architecture bh;