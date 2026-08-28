-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: group_declaration of configuration_declarative_item references an undeclared group_template: in group grp:undefined_template(sig1) the template name was not declared beforehand, verifying the prerequisite template dependency of group declarations
-- Expected Result: Triggers semantic error on undefined group template
-- Dependencies: None
-- =============================================================
entity cdi_smn3_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of cdi_smn3_ent is
  signal s:bit;
begin s<=a and b; y<=s; end architecture;
configuration cdi_smn3_cfg of cdi_smn3_ent is
  group my_grp : no_such_template (s);
  for rtl end for;
end configuration cdi_smn3_cfg;
