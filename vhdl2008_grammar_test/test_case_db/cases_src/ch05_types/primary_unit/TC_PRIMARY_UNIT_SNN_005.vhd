-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit ::= entity_declaration | configuration_declaration | package_declaration
-- Case Type: Negative
-- Test Focus: Syntax error -- entity declaration missing 'is' keyword
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pu_snn_no_is port(dout:out integer);  -- ERROR: missing 'is' keyword
end entity pu_snn_no_is;
