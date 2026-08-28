-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CFG_001
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Multi-component multi-binding + generic map + port map combined semantics: the entity architecture instantiates two different component kinds (generic and2 and non-generic or2), the configuration uses generic map and port map respectively to bind precisely to the corresponding entity/architecture pairs, verifying multi-component configuration semantic completeness
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity xor2 is
  generic (delay:time:=1 ns);
  port (x1,x2:in bit; z:out bit);
end entity xor2;

architecture rtl of xor2 is
begin
end architecture rtl;

entity cfg_full_ent is
  port(a,b,cin:in bit; sum,cout:out bit);
end entity;
architecture rtl of cfg_full_ent is
  component xor2 is
    generic(delay:time:=1 ns);
    port(x1,x2:in bit; z:out bit);
  end component;
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s_xor,s_and1,s_and2:bit;
begin
  u_xor:xor2 generic map(delay=>2 ns) port map(x1=>a,x2=>b,z=>s_xor);
  u_and1:and2 port map(x1=>a,x2=>b,z=>s_and1);
  u_and2:and2 port map(x1=>s_xor,x2=>cin,z=>s_and2);
  sum<=s_xor; cout<=s_and1 or s_and2;
end architecture;
configuration cfg_full of cfg_full_ent is
  for rtl
    for u_xor:xor2 use entity work.xor2(rtl)
      generic map(delay=>2 ns);
    for u_and1:and2 use entity work.and2(rtl);
    for u_and2:and2 use entity work.and2(rtl);
  end for;
end configuration cfg_full;
