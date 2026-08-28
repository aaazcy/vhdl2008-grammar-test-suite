-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Multiple processes coexisting: clock process (clk sensitivity) + reset process (rst_n sensitivity) + combinational process (a,b sensitivity) + wait-based process, verifying architecture_statement_part can contain any number of process concurrent statements in any style
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_mproc_ent is
  port(clk,rst_n,a,b:in bit; y_and,y_or:out bit);
end entity;
architecture rtl of arch_mproc_ent is
  signal s_and,s_or:bit:='0';
  signal s_clk_gated:bit:='0';
begin
  p_clk:process(clk)
  begin
    if clk'event and clk='1' then s_clk_gated<=clk; end if;
  end process;
  p_rst:process(rst_n)
  begin
    if rst_n='0' then s_and<='0'; s_or<='0'; end if;
  end process;
  p_comb:process(a,b)
  begin
    if rst_n='1' then s_and<=a and b; s_or<=a or b; end if;
  end process;
  p_wait:process
  begin
    wait on s_and,s_or;
    y_and<=s_and; y_or<=s_or;
  end process;
end architecture rtl;
