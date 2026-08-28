-- =============================================================
-- Case ID: TC_FORMAL_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator function_name ( formal_designator ) | type_mark ( formal_designator )
-- Case Type: Negative
-- Test Focus: formal_part: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity formal_part_e3 is end entity;
architecture bh of formal_part_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;