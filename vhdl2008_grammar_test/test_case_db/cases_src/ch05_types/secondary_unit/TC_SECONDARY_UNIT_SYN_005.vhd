-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SECONDARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit ::= architecture_body | package_body
-- Case Type: Positive
-- Test Focus: Positive: architecture_body with multiple concurrent processes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: architecture_body with multiple concurrent processes
entity sec_unit_syn_multi_proc is port(clk:in bit; dout:out integer); end entity;
architecture rtl of sec_unit_syn_multi_proc is
  signal s_cnt:integer:=0; signal s_inc:integer:=1;
begin
  p1:process(clk) begin if clk'event and clk='1' then s_cnt<=s_cnt+1; end if; end process;
  p2:process(clk) begin if clk'event and clk='1' then s_inc<=s_inc+2; end if; end process;
  dout<=s_cnt+s_inc;
end architecture;