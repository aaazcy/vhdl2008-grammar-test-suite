-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: impure function declaration with 2008 parameter keyword: impure function f_mon parameter(constant c:in integer) return boolean; verification of subprogram_declaration with parameter keyword
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sd_param is
  impure function f_thresh parameter(constant c:in integer) return boolean;
end package pkg_sd_param;
package body pkg_sd_param is
  impure function f_thresh parameter(constant c:in integer) return boolean is
  begin return c>10; end function;
end package body pkg_sd_param;
entity sd_param_ent is port(cnt:in integer; alert:out boolean); end entity;
architecture bh of sd_param_ent is begin alert<=work.pkg_sd_param.f_thresh(cnt); end architecture bh;
