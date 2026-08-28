-- =============================================================
-- Case ID: TC_LOGICAL_NAME_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_LOGICAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name ::= identifier
-- Case Type: Negative
-- Test Focus: ERROR: duplicate logical_name constant, shadowing not allowed
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
-- ERROR: duplicate logical_name constant, shadowing not allowed
entity logical_name_smn_duplicate is port(dout:out integer); end entity;
architecture rtl of logical_name_smn_duplicate is
  constant C_FILE : string := "file1.dat";
  constant C_FILE : string := "file2.dat";  -- ERROR: duplicate identifier
begin dout<=0; end architecture;