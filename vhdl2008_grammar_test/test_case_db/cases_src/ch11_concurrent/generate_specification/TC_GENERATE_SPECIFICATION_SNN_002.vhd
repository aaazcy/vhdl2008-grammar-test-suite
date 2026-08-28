-- =============================================================
-- Case ID: TC_GENERATE_SPECIFICATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERATE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: generate_specification ::= static_discrete_range static_expression | alternative_label
-- Case Type: Negative
-- Test Focus: generate_specification: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generate_specif_e2 is end entity;
architecture bh of generate_specif_e2 is
  -- ERROR: invalid syntax in generate_specification
  signal s : bit;
begin
  s <= '1'
end architecture bh;