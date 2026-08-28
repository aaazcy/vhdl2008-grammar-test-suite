-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: use_clause of configuration_declarative_item missing the library name prefix: .all is written directly without a library_name prefix, verifying the syntax requirement that a use_clause must specify a library name
-- Expected Result: Triggers syntax error on malformed use_clause missing library name
-- Dependencies: None
-- =============================================================
entity cdi_snn4_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_snn4_ent is begin y<=a; end architecture;
configuration cdi_snn4_cfg of cdi_snn4_ent is
  use .all;
  for rtl end for;
end configuration cdi_snn4_cfg;
