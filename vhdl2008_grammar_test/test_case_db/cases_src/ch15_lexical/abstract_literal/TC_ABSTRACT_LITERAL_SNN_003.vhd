-- =============================================================
-- Case ID: TC_ABSTRACT_LITERAL_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSTRACT_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: abstract_literal ::= decimal_literal | based_literal
-- Case Type: Negative
-- Test Focus: abstract_literal: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity abstract_litera_e3 is end entity;
architecture bh of abstract_litera_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;