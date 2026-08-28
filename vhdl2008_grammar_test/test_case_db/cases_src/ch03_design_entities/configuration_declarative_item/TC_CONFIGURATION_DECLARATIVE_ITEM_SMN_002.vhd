-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: Attribute value type mismatch in attribute_specification of configuration_declarative_item: the attribute is declared as integer type but assigned a string, verifying type compatibility checking of attribute specifications
-- Expected Result: Triggers semantic error on attribute value type mismatch
-- Dependencies: None
-- =============================================================
entity cdi_smn2_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_smn2_ent is begin y<=a; end architecture;
configuration cdi_smn2_cfg of cdi_smn2_ent is
  attribute version : integer;
  attribute version of rtl : architecture is "v2.0";
  for rtl end for;
end configuration cdi_smn2_cfg;
