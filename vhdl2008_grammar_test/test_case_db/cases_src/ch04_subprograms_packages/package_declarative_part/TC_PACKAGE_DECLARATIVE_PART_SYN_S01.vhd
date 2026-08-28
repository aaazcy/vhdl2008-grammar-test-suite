-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Test Focus: Package declarative part: zero or more package_declarative_items as complete visible region
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_package_declarative_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_package_declarative_part_syn_s01 is
  type t_pdp is range 0 to 127; constant C_PDP:t_pdp:=64;
  subtype t_pdp_s is t_pdp range C_PDP to 127;
  function f_pdp(x:t_pdp) return t_pdp;
  function f_pdp(x:t_pdp) return t_pdp is begin return x; end function;
begin
  r<=integer(f_pdp(C_PDP));end architecture bh;
