-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Positive
-- Test Focus: configuration_declarative_part with two declarative items (use_clause+attribute_specification): use std.standard.all followed by an attribute declaration and assignment, verifying two repetitions with mixed declarative item categories
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdp_two_ent is
  port(clk,d:in bit; q:out bit);
  attribute timing_note : string;
end entity;
architecture rtl of cdp_two_ent is
  signal s:bit;
begin s<=d when clk='1'; q<=s; end architecture;
configuration cdp_two_cfg of cdp_two_ent is
  use std.standard.all;
  attribute timing_note of all : architecture is "posedge_ff";
  for rtl end for;
end configuration cdp_two_cfg;
