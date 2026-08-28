-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: Minimal form: empty package_declarative_part - no declaration items, {} repeated zero times, verification of minimal form of package containing only package_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_empty_dp is
end package pkg_empty_dp;
entity pdp_min_ent is port(r:out integer); end entity;
architecture bh of pdp_min_ent is begin r<=0; end architecture bh;
