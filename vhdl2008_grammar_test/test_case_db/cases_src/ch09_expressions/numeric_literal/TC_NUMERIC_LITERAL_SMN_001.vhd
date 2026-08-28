-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Negative
-- Rule Description: The unit used by a physical_literal must come from the units list of a defined physical type; an undefined unit cannot be used
-- Error Category: undefined_physical_unit
-- Test Focus: SMN — physical_literal uses the undefined physical unit "km": type t_distance defines only m/cm/mm units, the "km" in 20 km is not in the units list
-- Expected Result: Triggers semantic error: unit "km" not defined in physical type t_distance
-- Dependencies: None
-- =============================================================
entity num_lit_smn_001 is
  port (
    x : out integer
  );
end entity num_lit_smn_001;

architecture undefined_unit of num_lit_smn_001 is
  type t_distance is range 0 to 1000000
    units
      mm;
      cm = 10 mm;
       m = 100 cm;
    end units t_distance;
  -- ERROR: "km" is not a unit defined in t_distance
  constant C_BAD : t_distance := 20 km;
begin
  x <= 0;
end architecture undefined_unit;
