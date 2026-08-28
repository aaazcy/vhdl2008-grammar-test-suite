-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_S01
-- Rule Type: Syntax
-- BNF Production: ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Test Focus: All concurrent stmt types: process, component inst, for/if generate, block, concurrent signal assign, concurrent assertion
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_architecture_statement_part_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_architecture_statement_part_syn_s01 is
  signal s_clk,s_rst:bit:='0'; signal s_a,s_b,s_c:integer:=0;
  component comp_ast is port(x:in integer;y:out integer); end component;
  procedure p_rep(v:integer) is begin report integer'image(v); end procedure;
begin
  s_a<=1; assert s_a>=0 report "neg" severity note;
  p_sync:process(s_clk) begin if rising_edge(s_clk) then s_b<=s_a+1; end if; end process;
  u_c:comp_ast port map(x=>s_a,y=>s_c);
  b_t:block is signal s_l:integer:=0; begin s_l<=s_a+s_b; end block;
  g_f:for i in 0 to 1 generate s_b<=s_b+i; end generate;
  g_if:if true generate s_c<=s_a; end generate; r<=s_c+s_b;end architecture bh;
