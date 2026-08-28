-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_declaration ::=
--   package identifier is new uninstantiated_package_name
--   interface_package_generic_map_aspect
-- Case Type: Negative
-- Test Focus: ERROR — missing the "new" keyword after "is".
--   BNF token "new" is required between "is" and the
--   uninstantiated_package_name.
-- Expected Result: Triggers syntax error (missing "new")
-- Dependencies: None
-- =============================================================

package pkg_buf is
  generic (N : positive := 8);
  function f_buf(x : bit_vector) return bit_vector;
end package pkg_buf;

package body pkg_buf is
  function f_buf(x : bit_vector) return bit_vector is
  begin return x; end function f_buf;
end package body pkg_buf;

-- ERROR: "new" keyword is missing after "is"
entity tc_ipd_snn_001 is
  generic (
    package my_buf is work.pkg_buf generic map (N => 16)
  );
  port (
    din  : in  bit_vector(15 downto 0);
    dout : out bit_vector(15 downto 0)
  );
end entity tc_ipd_snn_001;

architecture bh of tc_ipd_snn_001 is
begin
  dout <= din;
end architecture bh;
