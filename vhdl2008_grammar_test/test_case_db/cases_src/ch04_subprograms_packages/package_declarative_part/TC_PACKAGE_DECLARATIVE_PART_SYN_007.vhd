-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part with function declaration + component declaration: verification of forward subprogram declaration+component declaration in package declaration region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_fc_dp is
  function f_dbl(x:integer) return integer;
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
end package pkg_fc_dp;
package body pkg_fc_dp is
  function f_dbl(x:integer) return integer is begin return x*2; end function;
end package body pkg_fc_dp;
entity pdp_fc_ent is port(a:in integer; y:out integer); end entity;
architecture bh of pdp_fc_ent is begin y<=work.pkg_fc_dp.f_dbl(a); end architecture bh;
