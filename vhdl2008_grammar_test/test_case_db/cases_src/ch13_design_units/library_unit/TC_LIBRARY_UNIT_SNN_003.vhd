-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SNN_003
-- Rule Type: Syntax
-- BNF Production: library_unit
-- IEEE Section: 13.1
-- BNF Text: library_unit ::= primary_unit | secondary_unit
-- Test Focus: Invalid library_unit — duplicate secondary_unit names for the same entity
-- Case Type: Negative
-- Expected Result: Triggers error: duplicate architecture name for entity
-- Dependencies: None
-- =============================================================

-- library_unit: primary_unit
entity tc_library_unit_snn_003 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_library_unit_snn_003;

-- library_unit: secondary_unit (first)
architecture rtl of tc_library_unit_snn_003 is
begin
  y <= a;
end architecture rtl;

-- library_unit: secondary_unit with duplicate name — ERROR
architecture rtl of tc_library_unit_snn_003 is
begin
  y <= not a;
end architecture rtl;
