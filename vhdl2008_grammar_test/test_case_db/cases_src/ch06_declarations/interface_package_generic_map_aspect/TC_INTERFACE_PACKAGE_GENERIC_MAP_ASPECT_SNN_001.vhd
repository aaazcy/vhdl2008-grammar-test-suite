-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_generic_map_aspect ::=
--   generic_map_aspect | generic map ( <> ) | generic map ( default )
-- Case Type: Negative
-- Test Focus: ERROR — empty generic map with no valid content.
--   The BNF does not allow "generic map ( )" with nothing inside
--   the parentheses; valid alternatives are an association list,
--   "<>" (box), or "default".
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================

package pkg_shft is
  generic (STAGES : positive := 2);
  function f_shift(x : bit_vector) return bit_vector;
end package pkg_shft;

package body pkg_shft is
  function f_shift(x : bit_vector) return bit_vector is
  begin return x; end function f_shift;
end package body pkg_shft;

-- ERROR: empty parentheses "generic map ( )" is not a valid
-- interface_package_generic_map_aspect alternative.
entity tc_ipgma_snn_001 is
  generic (
    package shft_pkg is new work.pkg_shft generic map ( )
  );
  port (
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity tc_ipgma_snn_001;

architecture bh of tc_ipgma_snn_001 is
begin
  dout <= din;
end architecture bh;
