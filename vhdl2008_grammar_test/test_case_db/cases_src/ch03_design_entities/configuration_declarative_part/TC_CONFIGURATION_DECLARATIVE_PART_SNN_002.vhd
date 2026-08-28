-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_part ::= { configuration_declarative_item }
-- Case Type: Negative
-- Test Focus: configuration_declarative_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity configuration_d_e2 is end entity;
architecture bh of configuration_d_e2 is
  -- ERROR: invalid syntax in configuration_declarative_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;