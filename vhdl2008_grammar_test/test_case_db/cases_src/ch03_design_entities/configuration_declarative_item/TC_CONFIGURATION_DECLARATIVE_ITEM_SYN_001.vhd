-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Positive
-- Test Focus: Minimal configuration_declarative_item (use_clause): the configuration declarative part contains only one use_clause use std.standard.all, verifying the minimal form of use_clause as a legal declarative item in a configuration declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdi_use_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_use_ent is begin y<=a; end architecture;
configuration cdi_use_cfg of cdi_use_ent is
  use std.standard.all;
  for rtl end for;
end configuration cdi_use_cfg;
