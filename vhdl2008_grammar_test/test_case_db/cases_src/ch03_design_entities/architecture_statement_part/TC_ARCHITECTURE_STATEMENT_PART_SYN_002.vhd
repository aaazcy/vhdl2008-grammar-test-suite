-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: All 7 concurrent statement types coexist: process (clocked) + component_instantiation (port map) + for_generate + if_generate_else + block (guarded) + concurrent_signal_assignment (conditional when-else) + concurrent_assertion (postponed), verifying architecture_statement_part can hold all 7 kinds of concurrent_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_all_ent is
  generic(N:integer:=4);
  port(clk,rst_n:in bit; din:in bit; dout:out bit);
end entity;
architecture bh of asp_all_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
  signal s_chain:bit_vector(N-1 downto 0):=(others=>'0');
  signal s_g:bit:='1';
begin
  p_sync:process(clk,rst_n) begin
    if rst_n='0' then s_chain<=(others=>'0');
    elsif clk'event and clk='1' then s_chain(0)<=din; end if;
  end process;
  gen_chain:for i in 1 to N-1 generate
    u_dff:dff port map(clk=>clk,d=>s_chain(i-1),q=>s_chain(i));
  end generate;
  gen_out:if N>2 generate dout<=s_chain(N-1); else generate dout<='0'; end generate;
  b_g:block(s_g='1') begin s_g<=guarded '1'; end block;
  dout<=s_chain(N-1) when s_g='1' else '0';
  postponed assert s_chain(0)'stable(1 ns) report "Metastability" severity warning;
end architecture bh;
