-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: group_declaration in configuration_declarative_part missing the template name: group grp_name : is directly followed by the member list without a template name, verifying the mandatory component of a group declaration
-- Expected Result: Triggers syntax error on missing group template name
-- Dependencies: None
-- =============================================================
entity cdp_snn6_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of cdp_snn6_ent is
  signal s:bit;
begin s<=a and b; y<=s; end architecture;
configuration cdp_snn6_cfg of cdp_snn6_ent is
  group my_grp : (s);
  for rtl end for;
end configuration cdp_snn6_cfg;
