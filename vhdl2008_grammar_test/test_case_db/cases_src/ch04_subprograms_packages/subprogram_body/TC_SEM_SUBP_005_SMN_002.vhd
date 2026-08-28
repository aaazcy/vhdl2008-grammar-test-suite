-- =============================================================
-- Case ID: TC_SEM_SUBP_005_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SUBP_005
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Rule Description: Subprogram body parameter list must conform to its declaration parameter list
-- Case Type: Negative
-- Error Category: interface_violation
-- Test Focus: reading from output port
-- Expected Result: Triggers semantic error: interface_violation
-- Dependencies: None
-- =============================================================
entity sem_subp_005_smn2 is port(a:in bit; b:out bit); end entity;
architecture bh of sem_subp_005_smn2 is
  signal s_tmp:bit:='0';
begin
  -- ERROR: cannot read OUT port (pre-2008)
  s_tmp <= b;
  a <= s_tmp;
end architecture bh;