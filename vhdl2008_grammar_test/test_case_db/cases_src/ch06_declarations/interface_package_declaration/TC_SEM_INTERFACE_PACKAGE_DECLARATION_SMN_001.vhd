-- =============================================================
-- Case ID: TC_SEM_INTERFACE_PACKAGE_DECLARATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_declaration ::=
--   package identifier is new uninstantiated_package_name
--   interface_package_generic_map_aspect
-- Case Type: Negative (Semantic)
-- Test Focus: SEMANTIC ERROR — "plain_pkg" is a non-generic (plain)
--   package, but the production requires an
--   uninstantiated_package_name (a package with generics).
--   Instantiating a non-generic package via "is new" is illegal.
-- Expected Result: Triggers semantic error (package is not
--   uninstantiated / has no generics)
-- Dependencies: None
-- =============================================================

package plain_pkg is
  constant C_ANSWER : integer := 42;
end package plain_pkg;

-- ERROR: plain_pkg has no generics; cannot be used as
-- uninstantiated_package_name in an interface_package_declaration.
entity tc_ipd_smn_001 is
  generic (
    package bad_inst is new work.plain_pkg generic map (<>)
  );
  port (
    result : out integer
  );
end entity tc_ipd_smn_001;

architecture bh of tc_ipd_smn_001 is
begin
  result <= 0;
end architecture bh;
