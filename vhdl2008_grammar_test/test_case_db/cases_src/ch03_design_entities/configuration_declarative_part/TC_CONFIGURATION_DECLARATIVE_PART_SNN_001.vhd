-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: Illegal declarative item (signal_declaration) in configuration_declarative_part: a signal declaration is placed in the configuration declarative part (not a legal form of configuration_declarative_item), verifying the declarative part only accepts use_clause/attribute_specification/group_declaration
-- Expected Result: Triggers syntax error on illegal declarative item in configuration
-- Dependencies: None
-- =============================================================
entity cdp_snn1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_snn1_ent is
  signal s:bit;
begin y<=a; end architecture;
configuration cdp_snn1_cfg of cdp_snn1_ent is
  signal illegal_sig : bit;
  for rtl end for;
end configuration cdp_snn1_cfg;
