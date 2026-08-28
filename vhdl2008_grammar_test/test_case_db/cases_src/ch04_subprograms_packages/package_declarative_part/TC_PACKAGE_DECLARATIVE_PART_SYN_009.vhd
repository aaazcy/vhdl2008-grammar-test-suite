-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part with package_instantiation_declaration: verification of nested package instantiation declaration in parent package declaration region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_inner_pkg is
  generic(type t);
  function f_id(x:t) return t;
end package;
package body gen_inner_pkg is
  function f_id(x:t) return t is begin return x; end function;
end package body;
package pkg_outer is
  package p_inner is new work.gen_inner_pkg generic map(t=>integer);
end package pkg_outer;
entity pdp_pi_ent is port(a:in integer; y:out integer); end entity;
architecture bh of pdp_pi_ent is begin y<=work.pkg_outer.p_inner.f_id(a); end architecture bh;
