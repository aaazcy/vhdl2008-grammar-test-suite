-- =============================================================
-- Case ID: TC_SEM_CONC_007_SMN_010
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONC_007
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Rule Description: Actual port of mode IN cannot be connected to an aggregate or open
-- Case Type: Negative
-- Error Category: interface_violation
-- Test Focus: reading from output port
-- Expected Result: Triggers semantic error: interface_violation
-- Dependencies: None
-- =============================================================
entity sem_conc_007_smn2 is port(a:in bit; b:out bit); end entity;
architecture bh of sem_conc_007_smn2 is
  signal s_tmp:bit:='0';
begin
  -- ERROR: cannot read OUT port (pre-2008)
  s_tmp <= b;
  a <= s_tmp;
end architecture bh;