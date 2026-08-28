-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Positive
-- Test Focus: Minimal form of package_pathname — @work.config.MAX_VAL starts directly with @ followed by library name.package name.object name, with no extra package levels, verifying the minimal syntax of package_pathname (@ lib . pkg . obj)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_path_minimal is
  port(limit_ref : in integer; exceeds : out bit);
end entity;

architecture vhdl2008 of pkg_path_minimal is
  alias C_MAX is <<constant @work.limits.MAX : integer>>;
begin
  process(limit_ref)
  begin
    if limit_ref > C_MAX then exceeds <= '1';
    else exceeds <= '0'; end if;
  end process;
end architecture vhdl2008;
