-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: use_clause of configuration_declarative_item missing semicolon: use std.standard.all has no trailing semicolon, verifying the mandatory semicolon terminator of a use_clause
-- Expected Result: Triggers syntax error on missing semicolon after use_clause
-- Dependencies: None
-- =============================================================
entity cdi_snn1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_snn1_ent is begin y<=a; end architecture;
configuration cdi_snn1_cfg of cdi_snn1_ent is
  use std.standard.all
  for rtl end for;
end configuration cdi_snn1_cfg;
