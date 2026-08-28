-- =============================================================
-- Case ID: TC_ACTUAL_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator function_name ( actual_designator ) | type_mark ( actual_designator )
-- Case Type: Negative
-- Test Focus: actual_part: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity actual_part_e3 is end entity;
architecture bh of actual_part_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;