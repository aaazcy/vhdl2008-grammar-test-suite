-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: function declaration with multiple default-value parameters: function f_scale(x:integer; factor:integer:=1; offset:integer:=0) return integer; verification of multi-parameter subprogram_declaration with default values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sd_default is
  function f_scale(x:integer; factor:integer:=1; offset:integer:=0) return integer;
end package pkg_sd_default;
package body pkg_sd_default is
  function f_scale(x:integer; factor:integer:=1; offset:integer:=0) return integer is
  begin return x*factor+offset; end function;
end package body pkg_sd_default;
entity sd_default_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sd_default_ent is begin y<=work.pkg_sd_default.f_scale(a,2); end architecture bh;
