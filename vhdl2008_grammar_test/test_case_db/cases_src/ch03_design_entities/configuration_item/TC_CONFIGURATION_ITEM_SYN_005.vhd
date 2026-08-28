-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Positive
-- Test Focus: Two-level nested block_configuration as configuration_item: the outer for arch contains a component_configuration whose block_configuration clause nests to configure deeper instances, verifying the configuration item syntax of the recursive block structure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x,y:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity or2 is
  port (x,y:in bit; z:out bit);
end entity or2;

architecture rtl of or2 is
begin
end architecture rtl;

entity xor2 is
  port (x,y:in bit; z:out bit);
end entity xor2;

architecture rtl of xor2 is
  component xor2 is port(x,y:in bit; z:out bit); end component;
  signal s_x:bit;
begin
  u_xor2:xor2 port map(x=>x,y=>y,z=>s_x);
  z<=s_x;
end architecture rtl;

entity ci_nest_ent is
  port(a,b,cin:in bit; sum,cout:out bit);
end entity;
architecture rtl of ci_nest_ent is
  component xor2 is port(x,y:in bit; z:out bit); end component;
  component and2 is port(x,y:in bit; z:out bit); end component;
  component or2  is port(x,y:in bit; z:out bit); end component;
  signal s_xor1,s_and1,s_and2:bit;
begin
  u_xor1:xor2 port map(x=>a,y=>b,z=>s_xor1);
  u_xor2:xor2 port map(x=>s_xor1,y=>cin,z=>sum);
  u_and1:and2 port map(x=>a,y=>b,z=>s_and1);
  u_and2:and2 port map(x=>s_xor1,y=>cin,z=>s_and2);
  u_or1:or2 port map(x=>s_and1,y=>s_and2,z=>cout);
end architecture;
configuration ci_nest_cfg of ci_nest_ent is
  for rtl
    for u_xor1:xor2 use entity work.xor2(rtl);
      for rtl
        for u_xor2:xor2 use entity work.xor2(rtl);
        end for;
      end for;
    end for;
    for u_and1:and2 use entity work.and2(rtl);
    end for;
    for u_and2:and2 use entity work.and2(rtl);
    end for;
    for u_or1:or2 use entity work.or2(rtl);
    end for;
  end for;
end configuration ci_nest_cfg;
