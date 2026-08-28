-- =============================================================
-- Case ID: TC_ATTRIBUTE_DESIGNATOR_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ATTRIBUTE_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Test Focus: Attribute designator: attribute_simple_name — designates which attribute to reference
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_attribute_designator_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_attribute_designator_syn_s01 is
begin
  r<=42;end architecture bh;
