-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range static_expression | alternative_label
-- Case Type: Negative
-- Test Focus: generate_specification: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generate_specif_e3 is end entity;
architecture bh of generate_specif_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;