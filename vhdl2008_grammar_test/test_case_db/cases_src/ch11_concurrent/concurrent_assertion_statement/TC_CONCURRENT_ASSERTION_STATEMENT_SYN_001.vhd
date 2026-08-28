-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assert condition [ report expression ] [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: concurrent assertion postponed + immediate: a labeled postponed concurrent assertion (checking setup time) + an unlabeled immediate concurrent assertion (checking the reset condition), verifying the use of the postponed keyword of concurrent_assertion in the concurrent context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ca_ent is port(clk,rst_n,din:in bit; dout:out bit); end entity;
architecture bh of ca_ent is
  signal s_q:bit:='0';
begin
  a_setup:postponed assert din'stable(500 ps) or not(clk'event and clk='1')
    report "Setup violation on din" severity warning;
  assert not(rst_n='0' and clk='1') report "Reset+Clock conflict" severity error;
  process(clk,rst_n) begin
    if rst_n='0' then s_q<='0';
    elsif clk'event and clk='1' then s_q<=din; end if;
  end process;
  dout<=s_q;
end architecture bh;
