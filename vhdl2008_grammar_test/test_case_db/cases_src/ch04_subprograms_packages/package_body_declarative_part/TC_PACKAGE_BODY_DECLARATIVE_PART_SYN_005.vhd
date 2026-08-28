-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part with repetition of a single subprogram_body: function body is the only declarative_item, verification of {item} repeated once
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_single_body is
  function f_dbl(x:integer) return integer;
end package pkg_single_body;
package body pkg_single_body is
  function f_dbl(x:integer) return integer is
  begin return x*2; end function;
end package body pkg_single_body;
entity pbdp_single_ent is port(a:in integer; y:out integer); end entity;
architecture bh of pbdp_single_ent is begin y<=work.pkg_single_body.f_dbl(a); end architecture bh;
