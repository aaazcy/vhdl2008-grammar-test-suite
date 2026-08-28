-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Positive
-- Test Focus: secondary_unit_declaration for distance: cm=10 mm, m=100 cm, km=1000 m
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sud_syn_distance is port(dout:out integer); end entity;
architecture rtl of sud_syn_distance is
  type t_dist is range 0 to 1000000 units um; mm=1000 um; cm=10 mm; m=100 cm; km=1000 m; end units;
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;