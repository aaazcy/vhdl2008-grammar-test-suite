-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Negative
-- Test Focus: static model negative -- dereferencing a null access value
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity atd_smn_null_deref is port(dout:out integer); end entity;
architecture rtl of atd_smn_null_deref is
  type t_int_ptr is access integer;
  shared variable sv:t_int_ptr;
begin process begin dout<=sv.all; wait; end process;  -- ERROR: sv is null
end architecture;