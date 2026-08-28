-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: Minimal form: package instantiation without generic_map_aspect - package p is new gen_pkg, verification of minimal package_instantiation_declaration with only required tokens
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_pkg is
  generic(type t);
  function f_add(a,b:t) return t;
end package;
package body gen_pkg is
  function f_add(a,b:t) return t is begin return a; end function;
end package body;
package p_inst is new work.gen_pkg generic map(t=>integer);
entity pi_min_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of pi_min_ent is begin y<=work.p_inst.f_add(a,b); end architecture bh;
