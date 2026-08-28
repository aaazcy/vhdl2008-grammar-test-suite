-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SYN_003
-- Rule Type: Syntax
-- BNF Production: library_unit
-- IEEE Section: 13.1
-- BNF Text: library_unit ::= primary_unit | secondary_unit
-- Test Focus: Primary and secondary units as separate, explicit library_unit instances
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- library_unit: primary_unit
entity tc_library_unit_syn_003 is
  port (
    sel : in  bit;
    d0  : in  bit;
    d1  : in  bit;
    y   : out bit
  );
end entity tc_library_unit_syn_003;

-- library_unit: secondary_unit
architecture rtl of tc_library_unit_syn_003 is
begin
  with sel select y <=
    d0 when '0',
    d1 when '1';
end architecture rtl;
