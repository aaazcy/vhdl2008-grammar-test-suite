-- =============================================================
-- Case ID: TC_FORMAL_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator function_name ( formal_designator ) | type_mark ( formal_designator )
-- Case Type: Negative
-- Test Focus: formal_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity formal_part_e2 is end entity;
architecture bh of formal_part_e2 is
  -- ERROR: invalid syntax in formal_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;