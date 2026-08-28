-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Positive
-- Test Focus: process with two signals — process(rst, clk) separates the two signals with a comma
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sl_syn3_ent is port(rst,clk:in bit; din:in integer; y:out integer); end entity;
architecture bh of sl_syn3_ent is
begin
  process(rst, clk) is
  begin
    if rst = '1' then
      y <= 0;
    elsif clk'event and clk = '1' then
      y <= din;
    end if;
  end process;
end architecture bh;
