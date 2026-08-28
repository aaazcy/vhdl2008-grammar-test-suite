-- =============================================================
-- Case ID: TC_SEM_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_generic_map_aspect ::=
--   generic_map_aspect | generic map ( <> ) | generic map ( default )
-- Case Type: Negative (Semantic)
-- Test Focus: SEMANTIC ERROR — the generic_map_aspect maps a
--   formal generic name "MISSING_GEN" that does not exist in the
--   uninstantiated package pkg_lut. The syntax is valid but the
--   name resolution fails.
-- Expected Result: Triggers semantic error (unknown generic name)
-- Dependencies: None
-- =============================================================

package pkg_lut is
  generic (DEPTH : positive := 64);
  function f_lookup(addr : natural) return bit_vector;
end package pkg_lut;

package body pkg_lut is
  function f_lookup(addr : natural) return bit_vector is
  begin return "00000000"; end function f_lookup;
end package body pkg_lut;

-- ERROR: "MISSING_GEN" is not a generic of pkg_lut.
-- The generic_map_aspect syntax is valid but semantically wrong.
entity tc_ipgma_smn_001 is
  generic (
    package bad_map_pkg is new work.pkg_lut generic map (MISSING_GEN => 128)
  );
  port (
    addr  : in  natural;
    data  : out bit_vector(7 downto 0)
  );
end entity tc_ipgma_smn_001;

architecture bh of tc_ipgma_smn_001 is
begin
  data <= bad_map_pkg.f_lookup(addr);
end architecture bh;
