-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: package_header: generic_map_aspect missing terminating semicolon — the BNF shows generic_map_aspect ';' with a required semicolon separating the map from the package declarative part; omitting the ';' is a syntax error
-- Expected Result: Triggers syntax error: missing ";" at end of generic map aspect
-- Dependencies: None
-- =============================================================
package ph_nosemi_pkg is
  generic (G : natural := 1);
  generic map (G => 8)
  constant C : natural := G;
end package ph_nosemi_pkg;
