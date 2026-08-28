-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Positive
-- Test Focus: secondary_unit_declaration for time units: us = 1000 ns
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sud_syn_time_units is port(dout:out integer); end entity;
architecture rtl of sud_syn_time_units is
  type t_time is range 0 to 1000000000 units fs; ps=1000 fs; ns=1000 ps; us=1000 ns; end units;
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;