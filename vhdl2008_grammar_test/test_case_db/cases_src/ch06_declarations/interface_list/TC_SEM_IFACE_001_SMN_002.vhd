-- =============================================================
-- Case ID: TC_SEM_IFACE_001_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_IFACE_001
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Rule Description: Formal port mode IN cannot be updated (assigned) in the architecture body
-- Case Type: Negative
-- Error Category: interface_violation
-- Test Focus: reading from output port
-- Expected Result: Triggers semantic error: interface_violation
-- Dependencies: None
-- =============================================================
entity sem_iface_001_smn2 is port(a:in bit; b:out bit); end entity;
architecture bh of sem_iface_001_smn2 is
  signal s_tmp:bit:='0';
begin
  -- ERROR: cannot read OUT port (pre-2008)
  s_tmp <= b;
  a <= s_tmp;
end architecture bh;