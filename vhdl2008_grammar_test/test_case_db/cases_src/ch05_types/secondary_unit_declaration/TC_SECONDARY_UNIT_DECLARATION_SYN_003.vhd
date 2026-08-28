-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Positive
-- Test Focus: secondary_unit_declaration with identifier as unit name and physical_literal value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sud_syn_id is port(dout:out integer); end entity;
architecture rtl of sud_syn_id is
  type t_freq is range 0 to 1000000 units kHz; MHz=1000 kHz; GHz=1000 MHz; end units;
  signal s:integer:=0;
begin s<=1; dout<=s; end architecture;