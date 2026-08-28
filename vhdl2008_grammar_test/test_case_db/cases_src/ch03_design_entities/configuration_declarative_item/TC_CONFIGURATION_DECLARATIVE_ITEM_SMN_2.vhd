-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause | attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: use_clause of configuration_declarative_item references a nonexistent library: the library name in use nonexist_lib.some_pkg.all was not declared by a previous library_clause, verifying the library name of a use_clause must be visible through a library clause
-- Expected Result: Triggers semantic error on undefined library reference
-- Dependencies: None
-- =============================================================
entity cdi_sem1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdi_sem1_ent is begin y<=a; end architecture;
configuration cdi_sem1_cfg of cdi_sem1_ent is
  use fake_lib.fake_pkg.all;
  for rtl end for;
end configuration cdi_sem1_cfg;
