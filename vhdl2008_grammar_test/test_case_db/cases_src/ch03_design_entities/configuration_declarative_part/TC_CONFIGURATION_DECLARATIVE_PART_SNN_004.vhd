-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: use_clause in configuration_declarative_part missing the use keyword: library.pkg.item is written directly without the use prefix, verifying every item of the declarative part must be a legal configuration_declarative_item syntactic form
-- Expected Result: Triggers syntax error on missing 'use' keyword
-- Dependencies: None
-- =============================================================
entity cdp_snn4_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_snn4_ent is begin y<=a; end architecture;
configuration cdp_snn4_cfg of cdp_snn4_ent is
  std.standard.all;
  for rtl end for;
end configuration cdp_snn4_cfg;
