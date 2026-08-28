-- =============================================================
-- Case ID: TC_LABEL_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Negative
-- Test Focus: SNN: label contains illegal special character — @ symbol embedded in label identifier
-- Expected Result: Triggers syntax error: invalid identifier character in label
-- Dependencies: None
-- =============================================================
entity label_snn1_ent is port(y:out integer); end entity;
architecture bh of label_snn1_ent is
  signal s:integer:=0;
begin
  process is begin lbl@check: s<=1; y<=s; wait; end process; end architecture bh;
