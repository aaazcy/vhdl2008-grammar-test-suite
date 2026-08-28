-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: library_unit
-- IEEE Section: 13.1
-- BNF Text: library_unit ::= primary_unit | secondary_unit
-- Test Focus: primary_unit (entity_declaration) as a library_unit
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- library_unit: primary_unit (entity)
entity tc_library_unit_syn_s01 is
  port (
    d : in  bit;
    q : out bit
  );
end entity tc_library_unit_syn_s01;

-- library_unit: secondary_unit (architecture)
architecture rtl of tc_library_unit_syn_s01 is
begin
  q <= d;
end architecture rtl;
