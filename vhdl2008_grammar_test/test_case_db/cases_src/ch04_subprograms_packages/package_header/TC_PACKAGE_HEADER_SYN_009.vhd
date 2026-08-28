-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header with single generic(integer without default) in generic_clause + empty generic_map_aspect omitted: generic(W:integer), testing only the solo generic form of generic_clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_solo_gen is
  generic(W:integer);
  constant C_WIDTH:integer:=W;
end package pkg_solo_gen;
package my_pkg_solo_gen is new work.pkg_solo_gen generic map(W => 16);
entity ph_solo_ent is port(r:out integer); end entity;
architecture bh of ph_solo_ent is begin r<=work.my_pkg_solo_gen.C_WIDTH; end architecture bh;
