-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Positive
-- Test Focus: Minimal configuration_declarative_part (empty declarative part): the declarative part of the configuration declaration contains no configuration_declarative_item (zero repetitions), verifying the syntactic correctness of an empty declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdp_empty_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_empty_ent is begin y<=a; end architecture;
configuration cdp_empty_cfg of cdp_empty_ent is
  for rtl end for;
end configuration cdp_empty_cfg;
