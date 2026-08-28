-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: attribute_specification of configuration_declarative_item missing an attribute declaration: attribute of target:class is value is written directly without first declaring the attribute name and type, verifying the semantic rule that an attribute must be declared before use
-- Expected Result: Triggers semantic error on attribute not declared
-- Dependencies: None
-- =============================================================
entity cdi_smn4_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_smn4_ent is begin y<=a; end architecture;
configuration cdi_smn4_cfg of cdi_smn4_ent is
  attribute ghost_attr of rtl : architecture is "undeclared";
  for rtl end for;
end configuration cdi_smn4_cfg;
