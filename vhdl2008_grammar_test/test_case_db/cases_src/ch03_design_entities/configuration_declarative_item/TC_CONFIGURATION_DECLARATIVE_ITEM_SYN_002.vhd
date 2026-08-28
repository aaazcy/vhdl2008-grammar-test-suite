-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Positive
-- Test Focus: All 3 declarative item kinds in the configuration declarative part: use clause (with .all) + attribute specification (for an architecture label) + group declaration (signal group), verifying the full categories of configuration-level declarative items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdi2_ent is
  port(a:in bit; y:out bit);
  attribute cfg_note:string;
end entity;
architecture rtl of cdi2_ent is begin y<=a; end architecture;
configuration cdi2_cfg of cdi2_ent is
  use std.standard.all;
  attribute cfg_note of all:architecture is "config_decl_item_test";
  for rtl end for;
end configuration cdi2_cfg;
