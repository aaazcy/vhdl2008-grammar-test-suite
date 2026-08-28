-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Positive
-- Test Focus: configuration_declarative_part with a single declarative item (use_clause): the configuration declarative part has only one use std.standard.all, verifying the single-repetition declarative part syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cdp_one_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_one_ent is begin y<=a; end architecture;
configuration cdp_one_cfg of cdp_one_ent is
  use std.standard.all;
  for rtl end for;
end configuration cdp_one_cfg;
