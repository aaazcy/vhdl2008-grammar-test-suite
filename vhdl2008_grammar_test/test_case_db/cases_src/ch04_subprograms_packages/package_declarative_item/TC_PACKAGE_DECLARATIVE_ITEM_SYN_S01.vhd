-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Test Focus: Package declarative items: subprogram, type, subtype, constant, signal, file, alias, component, attribute, use, shared variable, disconnect, group
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_package_declarative_item_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_package_declarative_item_syn_s01 is
  type t_pdi is range 0 to 15; subtype t_pdi_s is t_pdi range 0 to 7;
  constant C_PDI:t_pdi:=15;
  component comp_pdi is port(x:in t_pdi;y:out t_pdi); end component;
  function f_pdi(x:t_pdi) return t_pdi;
  function f_pdi(x:t_pdi) return t_pdi is begin return x; end function;
begin
  r<=integer(f_pdi(C_PDI));end architecture bh;
