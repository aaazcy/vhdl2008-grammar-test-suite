-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Test Focus: Package body declarative items: subprogram body/decl/inst, type, subtype, constant, variable, file, alias, attribute, use clause, group
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_package_body_declarative_item_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_package_body_declarative_item_syn_s01 is
  type t_pbdi is range 0 to 63; subtype t_pbdi_s is t_pbdi range 0 to 31;
  constant C_PBDI:t_pbdi:=63;
  function f_pbdi(x:t_pbdi) return t_pbdi is begin return x/2; end function;
begin
  r<=integer(f_pbdi(C_PBDI));end architecture bh;
