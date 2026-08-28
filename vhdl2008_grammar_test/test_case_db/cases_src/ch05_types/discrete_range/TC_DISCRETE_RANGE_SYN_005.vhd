-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Positive
-- Test Focus: discrete_range as explicit range (0 to 15) in for loop
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dr_syn_for_loop is port(dout:out integer); end entity;
architecture rtl of dr_syn_for_loop is
  signal s:integer:=0;
begin process variable v:integer:=0; begin for i in 0 to 15 loop v:=v+i; end loop; s<=v; dout<=s; wait; end process; end architecture;