-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: Minimal form: empty package_body_declarative_part - no declaration items in body, {} repeated zero times, verification that declarative_part can be fully omitted
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_empty_body is
  constant C:integer:=99;
end package pkg_empty_body;
package body pkg_empty_body is
end package body pkg_empty_body;
entity pbdp_min_ent is port(r:out integer); end entity;
architecture bh of pbdp_min_ent is begin r<=work.pkg_empty_body.C; end architecture bh;
