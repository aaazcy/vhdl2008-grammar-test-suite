-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Test Focus: Process declarative items: subprogram body/decl/inst, type, subtype, constant, variable, file, alias, attribute decl/spec, use clause, group
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_process_declarative_item_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_process_declarative_item_syn_s01 is
begin
  p_pdi:process is
    type t_loc is range 0 to 63;
    variable v_loc:t_loc:=0;
  begin
    v_loc:=v_loc+1; r<=integer(v_loc); wait;
  end process;end architecture bh;
