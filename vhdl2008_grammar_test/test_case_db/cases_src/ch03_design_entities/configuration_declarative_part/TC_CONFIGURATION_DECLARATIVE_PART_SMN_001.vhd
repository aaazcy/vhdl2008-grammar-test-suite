-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: Duplicate group_template declaration in configuration_declarative_part: the same group_template name is declared twice, verifying the name uniqueness rule within the declarative part
-- Expected Result: Triggers semantic error on duplicate group template name
-- Dependencies: None
-- =============================================================
entity cdp_smn1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_smn1_ent is
  signal s:bit;
begin y<=a; end architecture;
configuration cdp_smn1_cfg of cdp_smn1_ent is
  group my_t is (signal);
  group my_t is (signal, signal);
  for rtl end for;
end configuration cdp_smn1_cfg;
