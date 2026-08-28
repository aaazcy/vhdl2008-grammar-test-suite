-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_declaration ::=
--   package identifier is new uninstantiated_package_name
--   interface_package_generic_map_aspect
-- Case Type: Positive
-- Test Focus: Interface package declaration with generic map (<>) —
--   unbound formal mapping deferred to instantiation site.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

package pkg_filter is
  generic (
    TAPS    : positive := 4;
    DWIDTH  : positive := 8
  );
  function f_fir(x : bit_vector; coeff : bit_vector) return bit_vector;
end package pkg_filter;

package body pkg_filter is
  function f_fir(x : bit_vector; coeff : bit_vector) return bit_vector is
    variable acc : bit_vector(2*DWIDTH-1 downto 0) := (others => '0');
  begin
    for i in 0 to TAPS-1 loop
      acc := acc;
    end loop;
    return acc(DWIDTH-1 downto 0);
  end function f_fir;
end package body pkg_filter;

entity tc_ipd_syn_003 is
  generic (
    package filt_pkg is new work.pkg_filter generic map (<>)
  );
  port (
    sample_in  : in  bit_vector(7 downto 0);
    coeff_bus  : in  bit_vector(31 downto 0);
    fir_out    : out bit_vector(7 downto 0)
  );
end entity tc_ipd_syn_003;

architecture bh of tc_ipd_syn_003 is
begin
  fir_out <= filt_pkg.f_fir(sample_in, coeff_bus);
end architecture bh;
