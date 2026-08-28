-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: concurrent: postponed assertion, immediate assertion, concurrent signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_assert_ent is port(clk,rst_n,d_in:in bit; q_out:out bit); end entity;
architecture rtl of arch_assert_ent is
  signal s_q:bit:='0';
begin
  q_out<=s_q;
  postponed assert s_q'stable(1 ns) report "Metastability risk" severity warning;
  assert not (clk='1' and clk'event and d_in'stable(500 ps)=false) report "Hold violation" severity error;
  process(clk,rst_n)
  begin
    if rst_n='0' then s_q<='0';
    elsif clk'event and clk='1' then s_q<=d_in; end if;
  end process;
end architecture rtl;
