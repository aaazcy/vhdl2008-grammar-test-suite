-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Negative
-- Test Focus: ERROR: logical_name used where a type is expected
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: logical_name used where a type is expected
entity logical_name_smn_type_context is port(dout:out integer); end entity;
architecture rtl of logical_name_smn_type_context is
  constant C_NAME : string := "my_name";
  signal s : C_NAME range 0 to 7;  -- ERROR: C_NAME is string not type
begin dout<=0; end architecture;