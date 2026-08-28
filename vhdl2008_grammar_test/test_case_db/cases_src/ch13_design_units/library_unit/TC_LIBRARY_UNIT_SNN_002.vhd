-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SNN_002
-- Rule Type: Syntax
-- BNF Production: library_unit
-- IEEE Section: 13.1
-- BNF Text: library_unit ::= primary_unit | secondary_unit
-- Test Focus: Invalid library_unit — malformed primary_unit missing 'is' keyword
-- Case Type: Negative
-- Expected Result: Triggers syntax error: entity declaration missing 'is'
-- Dependencies: None
-- =============================================================

-- library_unit: primary_unit with missing 'is' — ERROR
entity tc_library_unit_snn_002
  port (
    a : in  bit;
    y : out bit
  );  -- ERROR: missing 'is' keyword before port clause
end entity tc_library_unit_snn_002;

architecture rtl of tc_library_unit_snn_002 is
begin
  y <= a;
end architecture rtl;
