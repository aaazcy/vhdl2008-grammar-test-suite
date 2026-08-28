-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: Generic map argument count mismatch in component_configuration of configuration_item: the number of actuals provided by the generic mapping does not match the number of generics in the component declaration, verifying the semantic check on generic actual count
-- Expected Result: Triggers semantic error on generic map argument count mismatch
-- Dependencies: None
-- =============================================================
entity dff is
  generic (Tpd:time; Tsu:time; Thold:time);
  port (clk,d:in bit; q:out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity ci_smn2_ent is
  port(clk,d:in bit; q:out bit);
end entity;
architecture rtl of ci_smn2_ent is
  component dff is
    generic(Tpd:time; Tsu:time; Thold:time);
    port(clk,d:in bit; q:out bit);
  end component;
  signal s_q:bit;
begin
  u_dff:dff generic map(Tpd=>1 ns, Tsu=>500 ps, Thold=>200 ps) port map(clk=>clk,d=>d,q=>s_q);
  q<=s_q;
end architecture;
configuration ci_smn2_cfg of ci_smn2_ent is
  for rtl
    for u_dff:dff use entity work.dff(rtl)
      generic map(Tpd=>1 ns);
  end for;
end configuration ci_smn2_cfg;
