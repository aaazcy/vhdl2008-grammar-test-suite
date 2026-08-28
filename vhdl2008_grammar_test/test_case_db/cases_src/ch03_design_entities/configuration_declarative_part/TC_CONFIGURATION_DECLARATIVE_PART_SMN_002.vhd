-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: Wrong target entity class in attribute_specification of configuration_declarative_part: the class marker in attribute of signal:architecture does not match the target entity type, verifying the semantic correctness of entity class markers
-- Expected Result: Triggers semantic error on entity class mismatch in attribute specification
-- Dependencies: None
-- =============================================================
entity cdp_smn2_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_smn2_ent is begin y<=a; end architecture;
configuration cdp_smn2_cfg of cdp_smn2_ent is
  attribute my_note : string;
  attribute my_note of rtl : signal is "wrong_class";
  for rtl end for;
end configuration cdp_smn2_cfg;
