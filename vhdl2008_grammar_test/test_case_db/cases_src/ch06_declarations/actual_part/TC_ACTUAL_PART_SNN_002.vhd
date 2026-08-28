-- =============================================================
-- Case ID: TC_ACTUAL_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator function_name ( actual_designator ) | type_mark ( actual_designator )
-- Case Type: Negative
-- Test Focus: actual_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity actual_part_e2 is end entity;
architecture bh of actual_part_e2 is
  -- ERROR: invalid syntax in actual_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;