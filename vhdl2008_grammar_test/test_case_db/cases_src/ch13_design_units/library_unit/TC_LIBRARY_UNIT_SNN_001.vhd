-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Negative
-- Test Focus: invalid library_unit — a signal declaration as the start of library_unit: signal bad : bit; — the signal declaration is neither primary_unit nor any alternative form of secondary_unit (entity/configuration/package/architecture/package body), verifies the parser rejects non-library_unit syntax elements
-- Expected Result: Triggers syntax error: unexpected signal declaration, expected primary_unit or secondary_unit
-- Dependencies: None
-- =============================================================
signal bad : bit;

entity lu_bad_start is
  port (
    y : out bit
  );
end entity lu_bad_start;

architecture rtl of lu_bad_start is
begin
  y <= '0';
end architecture rtl;
