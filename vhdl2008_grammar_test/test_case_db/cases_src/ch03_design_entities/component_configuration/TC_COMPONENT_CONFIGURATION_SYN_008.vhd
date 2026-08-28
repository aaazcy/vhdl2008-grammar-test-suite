-- =============================================================
-- Case ID: TC_COMPONENT_CONFIGURATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_CONFIGURATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.3
-- Production: component_configuration ::= for component_specification [ binding_indication ] [ block_configuration ] end for ;
-- Case Type: Positive
-- Test Focus: Multi-level nested block_configuration in component_configuration: in the configuration declaration a block_configuration contains a component_configuration which nests a second-level block_configuration configuring deeper instances, verifying the syntactic correctness of the three-level nested configuration structure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  port (a,b:in bit; z:out bit);
end entity and2;

architecture beh of and2 is
begin
end architecture beh;

entity xor2 is
  port (a,b:in bit; z:out bit);
end entity xor2;

architecture rtl of xor2 is
  component xor2 is port(a,b:in bit; z:out bit); end component;
  component and2 is port(a,b:in bit; z:out bit); end component;
  signal s_xor,s_and:bit;
begin
  u_xor2:xor2 port map(a=>a,b=>b,z=>s_xor);
  u_and1:and2 port map(a=>a,b=>b,z=>s_and);
  z<=s_xor xor s_and;
end architecture rtl;

entity ccfg_nest_ent is
  port(x,y,cin:in bit; sum,cout:out bit);
end entity;
architecture rtl of ccfg_nest_ent is
  component xor2 is port(a,b:in bit; z:out bit); end component;
  component and2 is port(a,b:in bit; z:out bit); end component;
  component or2  is port(a,b:in bit; z:out bit); end component;
  signal s_xor1,s_and1,s_and2:bit;
begin
  u_xor1:xor2 port map(a=>x,b=>y,z=>s_xor1);
  u_xor2:xor2 port map(a=>s_xor1,b=>cin,z=>sum);
  u_and1:and2 port map(a=>x,b=>y,z=>s_and1);
  u_and2:and2 port map(a=>s_xor1,b=>cin,z=>s_and2);
  u_or1:or2 port map(a=>s_and1,b=>s_and2,z=>cout);
end architecture;
configuration ccfg_nest_cfg of ccfg_nest_ent is
  for rtl
    for u_xor1:xor2 use entity work.xor2(rtl);
      for rtl
        for u_xor2:xor2 use entity work.xor2(rtl);
          for rtl
            for u_and1:and2 use entity work.and2(beh);
              for beh
              end for;
            end for;
          end for;
        end for;
      end for;
    end for;
  end for;
end configuration ccfg_nest_cfg;
