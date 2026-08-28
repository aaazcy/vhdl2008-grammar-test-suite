-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Positive
-- Test Focus: component_configuration with binding_indication (with port map): for label:comp use entity work.ent(arch) port map(p1=>s1, p2=>s2), verifying a component_configuration whose binding contains a port mapping
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity half_adder is
  port (x,y:in bit; s,c:out bit);
end entity half_adder;

architecture rtl of half_adder is
begin
end architecture rtl;

entity ccfg_pmap_ent is
  port(a,b:in bit; sum,carry:out bit);
end entity;
architecture rtl of ccfg_pmap_ent is
  component half_adder is
    port(x,y:in bit; s,c:out bit);
  end component;
  signal s_sum,s_carry:bit;
begin
  u_ha:half_adder port map(x=>a,y=>b,s=>s_sum,c=>s_carry);
  sum<=s_sum; carry<=s_carry;
end architecture;
configuration ccfg_pmap_cfg of ccfg_pmap_ent is
  for rtl
    for u_ha:half_adder use entity work.half_adder(rtl)
      port map(x=>a, y=>b, s=>s_sum, c=>s_carry);
    end for;
  end for;
end configuration ccfg_pmap_cfg;
