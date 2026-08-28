-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: Single-character identifier as primary_unit_declaration — the
--            base unit 'g' (gram) anchors a physical type for mass measurement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mass_scalar is
  port (
    raw_grams : out integer
  );
end entity mass_scalar;

architecture measure of mass_scalar is
  type t_mass is range 0 to 1000000 units
    g;                              -- primary_unit_declaration: single-char identifier
    kg = 1000 g;                    -- secondary (not under test)
  end units;
  signal s_baseline : t_mass := 0 g;
begin
  s_baseline <= 500 g after 1 ns;
  raw_grams   <= t_mass'pos(s_baseline);
end architecture measure;
