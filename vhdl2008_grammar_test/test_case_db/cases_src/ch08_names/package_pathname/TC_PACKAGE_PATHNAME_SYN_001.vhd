-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Positive
-- Test Focus: Package pathname @library.package.object — `@lib.pkg.obj` starts with @ and is anchored at the library root; the package path form of VHDL 2008 external names is used to reference constants/signals declared inside a package
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkp_ent is port(y:out integer); end entity;
architecture bh of pkp_ent is
  signal s_local:integer:=42;
begin
  -- In external name: <<constant @work.pkg.C_MAX : integer>>
  -- package_pathname = @work.pkg.C_MAX (@-anchored in library)
  y<=s_local;
end architecture bh;
