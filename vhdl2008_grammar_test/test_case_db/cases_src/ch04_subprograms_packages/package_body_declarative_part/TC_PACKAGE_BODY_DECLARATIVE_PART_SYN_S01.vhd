-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Test Focus: Package body declarative part: zero or more package_body_declarative_items
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_package_body_declarative_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_package_body_declarative_part_syn_s01 is
  type t_pbdp is range 0 to 255; constant C_PBDP:t_pbdp:=128;
  function f_pbdp(x:t_pbdp) return t_pbdp is begin return x/4; end function;
begin
  r<=integer(f_pbdp(C_PBDP));end architecture bh;
