-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Negative
-- Test Focus: decimal_literal: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity decimal_literal_e3 is end entity;
architecture bh of decimal_literal_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;