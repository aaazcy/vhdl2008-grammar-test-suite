-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SNN_002
-- Rule Type: Syntax (Negative)
-- BNF Production: ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Negative
-- Test Focus: Missing colon between entity_name_list and entity_class — "a, b signal" without ":" violates the entity_specification grammar which requires ": entity_class" after entity_name_list
-- Expected Result: Triggers syntax error (missing colon)
-- Dependencies: None
-- =============================================================
entity espec_missing_colon is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of espec_missing_colon is
  attribute note : string;
  -- ERROR: missing ":" between entity_name_list and entity_class
  attribute note of a, b signal is "bad_spec";
  signal s_a, s_b : bit := '0';
begin
  s_a <= a; s_b <= b; y <= s_a and s_b;
end architecture bh;
