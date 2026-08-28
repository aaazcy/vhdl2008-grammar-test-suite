-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: group_declaration of configuration_declarative_item missing the group keyword: identifier:template name(members) is written directly without the leading group keyword, verifying the mandatory keyword of a group declaration
-- Expected Result: Triggers syntax error on missing 'group' keyword
-- Dependencies: None
-- =============================================================
entity cdi_snn6_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_snn6_ent is
  signal s:bit;
begin y<=a; end architecture;
configuration cdi_snn6_cfg of cdi_snn6_ent is
  group sig_type is (signal);
  my_grp : sig_type (s);
  for rtl end for;
end configuration cdi_snn6_cfg;
