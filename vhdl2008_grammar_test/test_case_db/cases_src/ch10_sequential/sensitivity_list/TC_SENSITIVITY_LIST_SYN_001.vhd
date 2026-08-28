-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Positive
-- Test Focus: Sensitivity list multi-signal + process(all): process with 3-signal sensitivity list (clk, rst, enable) + another process using the VHDL 2008 `all` keyword as implicit sensitivity, verifying the comma-separated multi-signal form of sensitivity_list and the all keyword
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sl_ent is port(clk,rst,en:in bit; a:in integer; y:out integer); end entity;
architecture bh of sl_ent is
  signal s_reg:integer:=0; signal s_comb:integer:=0;
begin
  process(clk,rst) begin
    if rst='1' then s_reg<=0;
    elsif clk'event and clk='1' then if en='1' then s_reg<=a; end if; end if;
  end process;
  process(all) begin s_comb<=s_reg*2; end process;
  y<=s_comb;
end architecture bh;
