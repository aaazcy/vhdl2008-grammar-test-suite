-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_declaration ::=
--   package identifier is new uninstantiated_package_name
--   interface_package_generic_map_aspect
-- Case Type: Negative
-- Test Focus: ERROR — missing the formal package "identifier" after
--   the "package" keyword. BNF requires an identifier between
--   "package" and "is".
-- Expected Result: Triggers syntax error (missing identifier)
-- Dependencies: None
-- =============================================================

package pkg_cmp is
  generic (W : positive := 8);
  function f_eq(a, b : bit_vector) return boolean;
end package pkg_cmp;

package body pkg_cmp is
  function f_eq(a, b : bit_vector) return boolean is
  begin return a = b; end function f_eq;
end package body pkg_cmp;

-- ERROR: formal package identifier is missing after "package"
entity tc_ipd_snn_004 is
  generic (
    package is new work.pkg_cmp generic map (W => 8)
  );
  port (
    comp_a, comp_b : in  bit_vector(7 downto 0);
    match          : out boolean
  );
end entity tc_ipd_snn_004;

architecture bh of tc_ipd_snn_004 is
begin
  match <= false;
end architecture bh;
