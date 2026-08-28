-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part with single constant_declaration: {item} repeated once, verification of minimal non-empty package declaration region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_single_dp is
  constant C_VER:integer:=1;
end package pkg_single_dp;
entity pdp_single_ent is port(r:out integer); end entity;
architecture bh of pdp_single_ent is begin r<=work.pkg_single_dp.C_VER; end architecture bh;
