-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Test Focus: Subprogram declarative items: type, subtype, constant, variable, file, alias, attribute, use clause, subprogram, group
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subprogram_declarative_item_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subprogram_declarative_item_syn_s01 is
  function f_sdi(x:integer) return integer is
    type t_sdi is range 0 to 99; constant C_OFF:t_sdi:=50; variable v:t_sdi:=C_OFF;
  begin v:=v+t_sdi(x); return integer(v); end function;
begin
  r<=f_sdi(25);end architecture bh;
