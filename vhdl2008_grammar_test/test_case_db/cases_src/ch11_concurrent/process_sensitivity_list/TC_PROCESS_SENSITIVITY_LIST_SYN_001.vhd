-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | signal_name { , signal_name }
-- Case Type: Positive
-- Test Focus: Process sensitivity list with explicit signals + VHDL2008 all: explicit process(clk,rst) + implicit process(all), verifying that the two process_sensitivity_list forms coexist
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity psl_ent is port(clk,rst:in bit; a:in integer; y:out integer); end entity;
architecture bh of psl_ent is signal s_reg:integer:=0; signal s_comb:integer:=0;
begin
  process(clk,rst) begin if rst='1' then s_reg<=0; elsif clk'event and clk='1' then s_reg<=a; end if; end process;
  process(all) begin s_comb<=s_reg*2; end process;
  y<=s_comb;
end architecture bh;
