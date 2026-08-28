-- =============================================================
-- Case ID: TC_INTEGER_TYPE_DEFINITION_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_INTEGER_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: integer_type_definition ::= range_constraint
-- Case Type: Negative
-- Test Focus: Static model negative -- integer type assignment with value exceeding range
-- Expected Result: Triggers range error
-- Dependencies: None
-- =============================================================
entity itd_smn_oob is port(dout:out integer); end entity;
architecture rtl of itd_smn_oob is
  type t_nibble is range 0 to 15;
  signal s:t_nibble:=20;  -- ERROR: 20 outside 0..15
begin
  dout<=0;
end architecture rtl;
