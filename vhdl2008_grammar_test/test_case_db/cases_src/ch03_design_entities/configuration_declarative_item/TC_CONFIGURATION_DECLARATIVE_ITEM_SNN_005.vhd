-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: attribute_specification of configuration_declarative_item missing the attribute keyword: the attribute name and type are written directly without the leading attribute keyword, verifying the mandatory keyword of an attribute declaration
-- Expected Result: Triggers syntax error on missing 'attribute' keyword
-- Dependencies: None
-- =============================================================
entity cdi_snn5_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_snn5_ent is begin y<=a; end architecture;
configuration cdi_snn5_cfg of cdi_snn5_ent is
  my_attr : string;
  attribute my_attr of rtl : architecture is "test";
  for rtl end for;
end configuration cdi_snn5_cfg;
