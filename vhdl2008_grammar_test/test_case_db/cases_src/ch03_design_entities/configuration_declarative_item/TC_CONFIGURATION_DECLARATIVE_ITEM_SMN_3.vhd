-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: attribute_specification of configuration_declarative_item references a nonexistent entity label: in attribute of no_such_label:label is val the label does not exist within the configuration region, verifying the entity label of an attribute specification must be visible
-- Expected Result: Triggers semantic error on undefined attribute target
-- Dependencies: None
-- =============================================================
entity cdi_sem2_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_sem2_ent is begin y<=a; end architecture;
configuration cdi_sem2_cfg of cdi_sem2_ent is
  attribute my_note : string;
  attribute my_note of ghost_label : label is "missing";
  for rtl end for;
end configuration cdi_sem2_cfg;
