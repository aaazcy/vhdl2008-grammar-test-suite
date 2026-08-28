-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Positive
-- Test Focus: block_configuration of configuration_item containing multiple component_configurations: bindings for several different components are configured sequentially within the same block, verifying multiple configuration items coexist in the same block
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity mux2 is
  port (i0,i1,sel:in bit; z:out bit);
end entity mux2;

architecture beh of mux2 is
begin
end architecture beh;

entity or2 is
  port (x1,x2:in bit; z:out bit);
end entity or2;

architecture rtl of or2 is
begin
end architecture rtl;

entity ci_multi_ent is
  port(a,b,sel:in bit; y:out bit);
end entity;
architecture rtl of ci_multi_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  component or2  is port(x1,x2:in bit; z:out bit); end component;
  component mux2 is port(i0,i1,sel:in bit; z:out bit); end component;
  signal s_and,s_or:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s_and);
  u_or:or2 port map(x1=>a,x2=>b,z=>s_or);
  u_mux:mux2 port map(i0=>s_and,i1=>s_or,sel=>sel,z=>y);
end architecture;
configuration ci_multi_cfg of ci_multi_ent is
  for rtl
    for u_and:and2 use entity work.and2(rtl);
    end for;
    for u_or:or2 use entity work.or2(rtl);
    end for;
    for u_mux:mux2 use entity work.mux2(beh);
    end for;
  end for;
end configuration ci_multi_cfg;
