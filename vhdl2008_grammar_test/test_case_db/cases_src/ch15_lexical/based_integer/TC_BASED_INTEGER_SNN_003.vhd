-- =============================================================
-- Case ID: TC_BASED_INTEGER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASED_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_integer ::= extended_digit { [ underline ] extended_digit }
-- Case Type: Negative
-- Test Focus: based_integer: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity based_integer_e3 is end entity;
architecture bh of based_integer_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;