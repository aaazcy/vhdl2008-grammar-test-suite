-- =============================================================
-- Case ID: TC_CONSTRAINT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Positive
-- Test Focus: constraint as range_constraint on integer subtype
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity con_syn_range is port(dout:out integer); end entity;
architecture rtl of con_syn_range is
  subtype t_addr is integer range 0 to 255;
  signal s:t_addr:=0;
begin s<=128; dout<=s; end architecture;