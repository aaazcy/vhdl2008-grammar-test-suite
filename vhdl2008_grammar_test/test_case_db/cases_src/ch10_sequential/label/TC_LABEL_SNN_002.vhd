-- =============================================================
-- Case ID: TC_LABEL_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Negative
-- Test Focus: SNN: label starts with digit — '2loop' is not a valid identifier for a label
-- Expected Result: Triggers syntax error: identifier cannot start with digit
-- Dependencies: None
-- =============================================================
entity label_snn2_ent is port(y:out integer); end entity;
architecture bh of label_snn2_ent is
  signal s:integer:=0;
begin
  process is begin 2loop: for i in 0 to 3 loop s<=i; end loop; y<=s; wait; end process; end architecture bh;
