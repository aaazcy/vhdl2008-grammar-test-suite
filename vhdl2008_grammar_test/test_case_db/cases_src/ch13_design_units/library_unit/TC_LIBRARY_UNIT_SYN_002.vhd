-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SYN_002
-- Rule Type: Syntax
-- BNF Production: library_unit
-- IEEE Section: 13.1
-- BNF Text: library_unit ::= primary_unit | secondary_unit
-- Test Focus: secondary_unit (architecture_body) as a library_unit
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- library_unit: primary_unit (entity)
entity tc_library_unit_syn_002 is
  port (
    a : in  bit;
    b : in  bit;
    y : out bit
  );
end entity tc_library_unit_syn_002;

-- library_unit: secondary_unit (architecture)
architecture rtl of tc_library_unit_syn_002 is
begin
  y <= a xor b;
end architecture rtl;
