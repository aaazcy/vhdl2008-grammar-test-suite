-- =============================================================
-- Case ID: TC_INTEGER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Negative
-- Test Focus: integer: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity integer_e3 is end entity;
architecture bh of integer_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;