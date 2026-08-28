-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PACKAGE_PATHNAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Positive
-- Rule Description: The library_logical_name in a package_pathname must reference a compiled library, and the package path must point to a package and object that actually exist in the library
-- Test Focus: Positive semantic case — in @work.param_pkg.THRESHOLD : natural, work is the standard working library and param_pkg.THRESHOLD is a constant declared in the package, so the complete path resolves correctly at elaboration time
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_path_valid_sem is
  port(val : in natural; alert : out bit);
end entity;

architecture vhdl2008 of pkg_path_valid_sem is
  alias C_TH is <<constant @work.param_pkg.THRESHOLD : natural>>;
begin
  process(val)
  begin
    if val > C_TH then alert <= '1';
    else alert <= '0'; end if;
  end process;
end architecture vhdl2008;
