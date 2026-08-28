-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: Minimal form: empty package_header (no generic_clause), verification of minimal compilable form when package_header as optional structure is fully omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_min_hdr is
  constant C_PI:real:=3.14159;
end package pkg_min_hdr;
entity ph_min_ent is port(r:out real); end entity;
architecture bh of ph_min_ent is begin r<=work.pkg_min_hdr.C_PI; end architecture bh;
