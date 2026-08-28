-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: use_clause of configuration_declarative_item imports package pkg_ghost which does not exist in the work library, verifying use_clause performs visibility/existence checking on package names and rejects references to nonexistent packages
-- Expected Result: Triggers semantic error: unit pkg_ghost not found in library work
-- Dependencies: None
-- =============================================================
entity cdi_smn1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_smn1_ent is begin y<=a; end architecture;
configuration cdi_smn1_cfg of cdi_smn1_ent is
  use work.pkg_ghost.all;
  for rtl end for;
end configuration cdi_smn1_cfg;
