-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Negative
-- Test Focus: invalid library_unit — architecture without preceding entity: architecture rtl of nonexistent is ... — architecture_body as secondary_unit, its corresponding entity must appear earlier as a primary_unit, an orphan architecture is not a valid library_unit sequence
-- Expected Result: Triggers syntax error: architecture requires preceding entity or entity not found
-- Dependencies: None
-- =============================================================
architecture rtl of lu_orphan is
  signal s : bit := '0';
begin
  s <= not s after 5 ns;
end architecture rtl;
