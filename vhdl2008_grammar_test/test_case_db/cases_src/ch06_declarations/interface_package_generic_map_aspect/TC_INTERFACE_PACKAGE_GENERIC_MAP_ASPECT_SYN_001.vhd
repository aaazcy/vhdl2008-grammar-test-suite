-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_generic_map_aspect ::=
--   generic_map_aspect | generic map ( <> ) | generic map ( default )
-- Case Type: Positive
-- Test Focus: First alternative: generic_map_aspect —
--   explicit formal-to-actual generic associations in
--   a package instantiation within an entity generic clause.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

package pkg_mult is
  generic (
    DW    : positive := 16;
    PIPE  : natural  := 0
  );
  function f_mul(a, b : bit_vector) return bit_vector;
end package pkg_mult;

package body pkg_mult is
  function f_mul(a, b : bit_vector) return bit_vector is
    variable r : bit_vector(2*DW-1 downto 0) := (others => '0');
  begin
    -- simplified: return truncated product
    r(DW-1 downto 0) := a;
    return r(DW-1 downto 0);
  end function f_mul;
end package body pkg_mult;

entity tc_ipgma_syn_001 is
  generic (
    package mul_pkg is new work.pkg_mult generic map (DW => 32, PIPE => 3)
  );
  port (
    factor_a, factor_b : in  bit_vector(31 downto 0);
    product            : out bit_vector(31 downto 0)
  );
end entity tc_ipgma_syn_001;

architecture bh of tc_ipgma_syn_001 is
begin
  product <= mul_pkg.f_mul(factor_a, factor_b);
end architecture bh;
