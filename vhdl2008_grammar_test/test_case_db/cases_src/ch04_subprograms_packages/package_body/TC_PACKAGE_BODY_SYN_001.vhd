-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Minimal form: empty package_body_declarative_part, end without package body and without name, verification of the minimal compilable form of package_body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_min is
  constant c:integer:=42;
end package pkg_min;
package body pkg_min is
end package body;
entity pb_min_ent is port(r:out integer); end entity;
architecture bh of pb_min_ent is begin r<=work.pkg_min.c; end architecture bh;
