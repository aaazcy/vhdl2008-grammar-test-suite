-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROCESS_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Test Focus: Process declarative part: zero or more process_declarative_items
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_process_declarative_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_process_declarative_part_syn_s01 is
begin
  p_pdp:process is
    type t_pdp is range 0 to 127;
    constant C_PDP:t_pdp:=100;
    variable v_pdp:t_pdp:=C_PDP;
  begin
    r<=integer(v_pdp); wait;
  end process;end architecture bh;
