-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "new" keyword - package p_bad is generic_pkg generic map(...); parser cannot recognize it as package_instantiation_declaration
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
package gen_pkg_base is generic(type t); function f_zero return t; end package;
package body gen_pkg_base is function f_zero return t is variable v:t; begin return v; end function; end package body;
-- ERROR: missing 'new' keyword before uninstantiated_package_name
package p_bad is gen_pkg_base generic map(t=>integer);
entity pi_bad_ent is port(r:out integer); end entity;
architecture bh of pi_bad_ent is begin r<=0; end architecture bh;
