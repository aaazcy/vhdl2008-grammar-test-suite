-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: function declaration with parameters and return type - function f_max(a,b:integer) return integer; verification of function_specification as full parameters+return type form of subprogram_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sd_func is
  function f_max(a,b:integer) return integer;
end package pkg_sd_func;
package body pkg_sd_func is
  function f_max(a,b:integer) return integer is begin if a>b then return a; else return b; end if; end function;
end package body pkg_sd_func;
entity sd_func_ent is port(x,y:in integer; z:out integer); end entity;
architecture bh of sd_func_ent is begin z<=work.pkg_sd_func.f_max(x,y); end architecture bh;
