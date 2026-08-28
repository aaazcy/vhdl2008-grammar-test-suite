-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: Attribute declaration in configuration_declarative_part missing the type marker: attribute attr_name lacks the colon and type name, verifying the complete mandatory syntax of attribute_specification
-- Expected Result: Triggers syntax error on incomplete attribute declaration
-- Dependencies: None
-- =============================================================
entity cdp_snn5_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_snn5_ent is begin y<=a; end architecture;
configuration cdp_snn5_cfg of cdp_snn5_ent is
  attribute broken_attr;
  for rtl end for;
end configuration cdp_snn5_cfg;
