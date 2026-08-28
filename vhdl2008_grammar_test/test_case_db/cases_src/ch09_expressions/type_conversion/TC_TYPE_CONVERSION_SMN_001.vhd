-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_TYPE_CONVERSION_NUMERIC
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Negative
-- Rule Description: Type conversions between numeric types (integer, real) must follow defined conversion rules. Conversion between integer and real is allowed but between enumeration and integer is not.
-- Error Category: Invalid numeric conversion
-- Test Focus: SMN: illegal conversion from enumeration to integer — integer(RED) attempts to convert an enumeration literal to integer; no type conversion rule is defined between enumeration and integer
-- Expected Result: Triggers type error: cannot convert enumeration literal to integer
-- Dependencies: None
-- =============================================================

entity ent_tc_smn_001 is
  port (y : out integer);
end entity ent_tc_smn_001;

architecture enum2int of ent_tc_smn_001 is
  type t_color is (RED, GREEN, BLUE);
begin
  -- ERROR: No conversion defined from enumeration to integer
  y <= integer(RED);
end architecture enum2int;
