-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: Mixed statement part with component instantiation + concurrent assertion + conditional signal assignment - statement part contains component_instantiation (dff instantiation), concurrent_assertion (checking a reset-forbidden condition), and conditional_signal_assignment (when-else output selection), verifying different kinds of concurrent_statements can mix freely in the same statements region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_dff is port(clk,rst:in bit; d:in bit; q:out bit); end entity;
architecture rtl of asp_dff is
begin
  q<='0';
end architecture rtl;
entity asp_mix_ent is port(clk,rst:in bit; d:in bit; q:out bit); end entity;
architecture bh of asp_mix_ent is
  signal s_q,s_d:bit;
begin
  s_d<=d;
  u_dff:entity work.asp_dff(rtl) port map(clk=>clk, rst=>rst, d=>s_d, q=>s_q);
  assert not(rst='0' and clk'event and clk='1') report "rst must be high during clk edge" severity warning;
  q<=s_q when rst='1' else '0';
end architecture bh;
