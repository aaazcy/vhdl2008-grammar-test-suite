-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_generic_map_aspect ::=
--   generic_map_aspect | generic map ( <> ) | generic map ( default )
-- Case Type: Negative
-- Test Focus: ERROR — the token "generic" is repeated where only
--   "generic map ( ... )" is expected. The BNF expects
--   interface_package_generic_map_aspect to follow
--   uninstantiated_package_name directly — a second leading
--   "generic" token is illegal.
-- Expected Result: Triggers syntax error (unexpected "generic")
-- Dependencies: None
-- =============================================================

package pkg_xor is
  generic (W : positive := 4);
  function f_xor(a, b : bit_vector) return bit_vector;
end package pkg_xor;

package body pkg_xor is
  function f_xor(a, b : bit_vector) return bit_vector is
  begin return a xor b; end function f_xor;
end package body pkg_xor;

-- ERROR: duplicate "generic" keyword — the BNF already consumes
-- "package" and expects "generic map" as part of the
-- interface_package_generic_map_aspect token, not a second
-- "generic" keyword.
entity tc_ipgma_snn_004 is
  generic (
    package xor_pkg is new work.pkg_xor generic generic map (W => 4)
  );
  port (
    op_a, op_b : in  bit_vector(3 downto 0);
    op_r       : out bit_vector(3 downto 0)
  );
end entity tc_ipgma_snn_004;

architecture bh of tc_ipgma_snn_004 is
begin
  op_r <= op_a xor op_b;
end architecture bh;
