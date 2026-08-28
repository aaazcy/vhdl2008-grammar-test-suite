-- =============================================================
-- Case ID: TC_LABEL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_LABEL
-- Standard Reference: IEEE 1076-2008 Section 10.1
-- Production: label ::= identifier
-- Case Type: Negative
-- Test Focus: SNN: label is a VHDL reserved word — 'signal' used as label identifier
-- Expected Result: Triggers syntax error: reserved word cannot be used as label
-- Dependencies: None
-- =============================================================
entity label_snn3_ent is port(y:out integer); end entity;
architecture bh of label_snn3_ent is
  signal s:integer:=0;
begin
  process is begin signal: s<=1; y<=s; wait; end process; end architecture bh;
