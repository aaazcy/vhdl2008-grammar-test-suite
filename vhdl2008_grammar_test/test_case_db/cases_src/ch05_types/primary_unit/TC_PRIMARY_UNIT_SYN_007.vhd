-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit ::= entity_declaration | configuration_declaration | package_declaration
-- Case Type: Positive
-- Test Focus: primary_unit as configuration_declaration binding entity to architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pu_cfg_ent is port(dout:out integer); end entity;
architecture rtl of pu_cfg_ent is begin dout<=0; end architecture;
configuration pu_cfg of pu_cfg_ent is for rtl end for; end configuration;
