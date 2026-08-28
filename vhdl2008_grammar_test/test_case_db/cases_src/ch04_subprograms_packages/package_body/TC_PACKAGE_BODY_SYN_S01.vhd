-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Test Focus: Package body: package body identifier is package_body_declarative_part end [package body] [identifier];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_package_body_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_package_body_syn_s01 is
  constant C_PB:integer:=100;
  function f_pb(x:integer) return integer is begin return x*C_PB; end function;
begin
  r<=f_pb(1);end architecture bh;
