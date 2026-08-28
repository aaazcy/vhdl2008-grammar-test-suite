-- =============================================================
-- Case ID: TC_SENSITIVITY_LIST_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_list ::= signal_name { , signal_name }
-- Case Type: Positive
-- Test Focus: Minimal single-signal sensitivity_list — process(clk) contains only one signal name clk
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sl_syn2_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of sl_syn2_ent is
  signal s_cnt : integer := 0;
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      s_cnt <= s_cnt + 1;
    end if;
    y <= s_cnt;
  end process;
end architecture bh;
