-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: Multiple processes with different sensitivity-list styles - statement part contains 3 process_statements: process(clk) edge-sensitive + process(all) VHDL 2008 implicit sensitivity + process with explicit wait on, verifying multiple process sensitivity styles are each legal as independent concurrent_statements in the same architecture statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_procs_ent is port(clk:in bit; a,b:in integer; y1,y2,y3:out integer); end entity;
architecture bh of asp_procs_ent is
  signal s_a,s_b:integer:=0;
begin
  s_a<=a; s_b<=b;
  p_edge:process(clk) begin
    if clk'event and clk='1' then y1<=s_a+s_b; end if;
  end process;
  p_comb:process(all) begin
    y2<=s_a*s_b;
  end process;
  p_wait:process begin
    wait on s_a,s_b;
    y3<=s_a-s_b;
  end process;
end architecture bh;
