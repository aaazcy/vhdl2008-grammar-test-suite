-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: Two package instantiations in the same scope using the same generic package with different generic maps: p_int instantiates t=integer, p_real instantiates t=real, verification that package_instantiation_declaration can be used multiple times with different actual parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package math_pkg is
  generic(type t);
  function f_max(a,b:t) return t;
end package;
package body math_pkg is
  function f_max(a,b:t) return t is begin return a; end function;
end package body;
package p_int is new work.math_pkg generic map(t=>integer);
package p_real is new work.math_pkg generic map(t=>real);
entity pi_multi_ent is port(a:out integer; b:out real); end entity;
architecture bh of pi_multi_ent is begin a<=work.p_int.f_max(3,7); b<=work.p_real.f_max(1.5,2.8); end architecture bh;
