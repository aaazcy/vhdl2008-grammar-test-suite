-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: group_declaration in configuration_declarative_part references a nonexistent signal: the group member list contains an invisible signal name, verifying objects referenced by a group in the declarative part must be visible within its scope
-- Expected Result: Triggers semantic error on undefined signal in group declaration
-- Dependencies: None
-- =============================================================
entity cdp_sem2_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_sem2_ent is begin y<=a; end architecture;
configuration cdp_sem2_cfg of cdp_sem2_ent is
  group sig_grp_temp is (signal);
  group sg : sig_grp_temp (ghost_signal);
  for rtl end for;
end configuration cdp_sem2_cfg;
