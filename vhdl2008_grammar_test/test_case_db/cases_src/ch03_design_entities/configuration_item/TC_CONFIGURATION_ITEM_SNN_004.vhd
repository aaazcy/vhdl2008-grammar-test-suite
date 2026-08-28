-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: Illegal use clause form in component_configuration of configuration_item: for label:comp use lacks the entity keyword after use, verifying a binding indication must contain the entity keyword
-- Expected Result: Triggers syntax error on missing 'entity' in binding indication
-- Dependencies: None
-- =============================================================
entity ci_snn4_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of ci_snn4_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s); y<=s;
end architecture;
configuration ci_snn4_cfg of ci_snn4_ent is
  for rtl
    for u_and:and2 use work.and2(rtl);
  end for;
end configuration ci_snn4_cfg;
