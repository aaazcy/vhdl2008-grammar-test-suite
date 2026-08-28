-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Positive
-- Test Focus: package_pathname with single package level — '@work.config_pkg.MAX_ITEMS' references a constant in a library package; the @ prefix followed by library.package.object forms the package_pathname
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_path_syn_ent is
  port(local_max : in integer; exceeds : out bit);
end entity;

architecture vhdl2008 of pkg_path_syn_ent is
  alias cfg_max is <<constant @work.config_pkg.MAX_ITEMS : integer>>;
  signal exceed_reg : bit := '0';
begin
  process(local_max)
  begin
    if local_max > cfg_max then
      exceed_reg <= '1';
    else
      exceed_reg <= '0';
    end if;
  end process;
  exceeds <= exceed_reg;
end architecture vhdl2008;
