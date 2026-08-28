-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Positive
-- Test Focus: Configuration declarative part with use clause + attribute + group: use std.standard.all + attribute specifications (2, for architecture and signal respectively) + group declaration (timing_grp), verifying the configuration declarative part can contain multiple declarative item kinds
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdp2_ent is
  port(clk,d:in bit; q:out bit);
  attribute cfg_style:string; attribute cfg_ver:integer;
  group timing_sigs is (signal,signal);
end entity;
architecture rtl of cdp2_ent is signal s_q:bit; begin s_q<=d when clk='1'; q<=s_q; end architecture;
configuration cdp2_cfg of cdp2_ent is
  use std.standard.all;
  attribute cfg_style of all:architecture is "simple_latch";
  attribute cfg_ver of all:architecture is 1;
  group timing_grp : timing_sigs (clk, d);
  for rtl end for;
end configuration cdp2_cfg;
