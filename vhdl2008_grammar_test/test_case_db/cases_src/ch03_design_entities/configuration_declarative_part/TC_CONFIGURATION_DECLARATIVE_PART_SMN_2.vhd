-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: attribute_specification in configuration_declarative_part references the undeclared attribute no_such_attr, verifying attribute name resolution checking in the configuration declarative part and that an undeclared attribute cannot be used in attribute_specification
-- Expected Result: Triggers semantic error: no declaration for no_such_attr
-- Dependencies: None
-- =============================================================
entity cdp_sem1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_sem1_ent is begin y<=a; end architecture;
configuration cdp_sem1_cfg of cdp_sem1_ent is
  attribute no_such_attr of cdp_sem1_ent : entity is "x";
  for rtl end for;
end configuration cdp_sem1_cfg;
