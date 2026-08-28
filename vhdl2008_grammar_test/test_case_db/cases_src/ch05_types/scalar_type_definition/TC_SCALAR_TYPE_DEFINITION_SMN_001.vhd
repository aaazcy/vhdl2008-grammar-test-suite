-- =============================================================
-- Case ID: TC_SCALAR_TYPE_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_SCALAR_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: scalar_type_definition ::= enumeration_type_definition | integer_type_definition | floating_type_definition | physical_type_definition
-- Case Type: Negative
-- Test Focus: static model negative -- assignment out of scalar type range
-- Expected Result: Triggers
-- Dependencies: None
-- =============================================================
entity std_smn_oob is port(dout:out integer); end entity;
architecture rtl of std_smn_oob is
  type t_nibble is range 0 to 15;
  signal s:t_nibble:=16;  -- ERROR: 16 outside 0..15 range
begin dout<=0; end architecture;