-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_declaration end with [package] and [package_simple_name]: end package pkg_math, verification of complete closing token syntax
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_math is
  function f_sqr(x:integer) return integer;
  function f_abs(x:integer) return integer;
end package pkg_math;
package body pkg_math is
  function f_sqr(x:integer) return integer is begin return x*x; end function;
  function f_abs(x:integer) return integer is begin if x<0 then return -x; else return x; end if; end function;
end package body pkg_math;
entity pd_math_ent is port(a:in integer; sq,ab:out integer); end entity;
architecture bh of pd_math_ent is begin sq<=work.pkg_math.f_sqr(a); ab<=work.pkg_math.f_abs(a); end architecture bh;
