-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: Member class mismatch of group_declaration in configuration_declarative_part: the template is defined as (signal) but the member list contains a label-class entity, verifying group members must be consistent with the entity classes defined by the template
-- Expected Result: Triggers semantic error on group constituent class mismatch
-- Dependencies: None
-- =============================================================
entity cdp_smn3_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cdp_smn3_ent is
  signal s:bit;
begin y<=a; end architecture;
configuration cdp_smn3_cfg of cdp_smn3_ent is
  group sig_only is (signal);
  group bad_grp : sig_only (rtl);
  for rtl end for;
end configuration cdp_smn3_cfg;
