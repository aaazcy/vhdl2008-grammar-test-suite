-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Test Focus: Configuration declarative part: zero or more configuration_declarative_items
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_configuration_declarative_part_syn_s01 is
  port(r:out integer);
  attribute cfg_dp:string;
end entity;
architecture bh of tc_configuration_declarative_part_syn_s01 is
begin
  r<=100;
end architecture bh;
configuration cdp_cfg of tc_configuration_declarative_part_syn_s01 is
  attribute cfg_dp of all:architecture is "cfg_part_test";
  for bh end for;
end configuration cdp_cfg;
