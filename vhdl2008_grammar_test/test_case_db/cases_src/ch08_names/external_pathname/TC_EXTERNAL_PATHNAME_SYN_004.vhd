-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Positive
-- Test Focus: external_pathname selects the package_pathname branch — in <<constant @work.pkg.CONST : integer>>, @work.pkg.CONST is in package_pathname form (beginning with @, located via a library and package), verifying the syntax of the package_pathname branch of external_pathname
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_path_pkg_sel is
  port(in_val : in natural; ok_flag : out bit);
end entity;

architecture vhdl2008 of ext_path_pkg_sel is
  alias C_REF is <<constant @work.config_pkg.BUS_W : natural>>;
begin
  process(in_val)
  begin
    if in_val = C_REF then ok_flag <= '1';
    else ok_flag <= '0'; end if;
  end process;
end architecture vhdl2008;
