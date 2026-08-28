-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part with declaration-implementation pair of subprogram_declaration(forward) + subprogram_body(implementation): declare first then implement in body, verification of coexistence of two related body items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_fwd_body is
  function f_calc(a,b:integer) return integer;
end package;
package body pkg_fwd_body is
  function f_calc(a,b:integer) return integer is begin return a+b; end function;
end package body pkg_fwd_body;
entity pbdp_fwd_ent is port(x,y:in integer; z:out integer); end entity;
architecture bh of pbdp_fwd_ent is begin z<=work.pkg_fwd_body.f_calc(x,y); end architecture bh;
