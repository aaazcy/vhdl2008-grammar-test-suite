-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Positive
-- Test Focus: component_configuration with both binding_indication and block_configuration: for label:comp use entity...generic map...port map... followed by a nested for...end for sub-block, verifying the complete syntactic form with both optional clauses present together
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  generic (Tpd:time);
  port (clk,d:in bit; q,qn:out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity ccfg_full_ent is
  port(clk,d:in bit; q,qn:out bit);
end entity;
architecture rtl of ccfg_full_ent is
  component dff is generic(Tpd:time); port(clk,d:in bit; q,qn:out bit); end component;
  component inv is port(x:in bit; z:out bit); end component;
  signal s_q,s_qn:bit;
begin
  u_dff:dff generic map(Tpd=>1 ns) port map(clk=>clk,d=>d,q=>s_q,qn=>s_qn);
  u_inv:inv port map(x=>s_q,z=>s_qn);
  q<=s_q; qn<=s_qn;
end architecture;
configuration ccfg_full_cfg of ccfg_full_ent is
  for rtl
    for u_dff:dff use entity work.dff(rtl)
      generic map(Tpd=>800 ps)
      port map(clk=>clk, d=>d, q=>s_q, qn=>s_qn);
      for rtl
      end for;
    end for;
    for u_inv:inv use entity work.inv(rtl);
    end for;
  end for;
end configuration ccfg_full_cfg;
