-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Test Focus: Configuration declarative items: use clause, attribute specification, group declaration
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_configuration_declarative_item_syn_s01 is
  port(r:out integer);
  attribute cfg_dbg:string;
end entity;
architecture bh of tc_configuration_declarative_item_syn_s01 is
begin
  r<=1;
end architecture bh;
configuration cdi_cfg of tc_configuration_declarative_item_syn_s01 is
  attribute cfg_dbg of all:architecture is "cfg_item_test";
  for bh end for;
end configuration cdi_cfg;
