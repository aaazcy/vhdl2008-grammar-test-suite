-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Negative
-- Test Focus: ERROR: package body missing implementation for a declared function
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: package body missing implementation for a declared function
entity sec_unit_smn_missing_body is port(dout:out integer); end entity;
architecture rtl of sec_unit_smn_missing_body is
  package pkg is function f return integer; end package;
  package body pkg is end package body;  -- ERROR: function f not implemented
begin dout<=0; end architecture;