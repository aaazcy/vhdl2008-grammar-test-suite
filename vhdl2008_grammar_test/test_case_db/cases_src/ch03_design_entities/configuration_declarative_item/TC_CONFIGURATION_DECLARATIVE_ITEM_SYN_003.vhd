-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Positive
-- Test Focus: configuration_declarative_item (attribute_specification): the configuration declarative part declares two attributes and applies attribute_specification to an architecture label and a signal object respectively, verifying the syntactic correctness of attribute specifications as configuration declarative items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdi_attr_ent is
  port(clk:in bit; q:out bit);
  attribute synth_keep : boolean;
  attribute style_note : string;
end entity;
architecture rtl of cdi_attr_ent is
  signal s:bit;
begin
  s<=clk; q<=s;
end architecture;
configuration cdi_attr_cfg of cdi_attr_ent is
  attribute synth_keep of all : architecture is true;
  attribute style_note of all : architecture is "simple_buffer";
  for rtl end for;
end configuration cdi_attr_cfg;
