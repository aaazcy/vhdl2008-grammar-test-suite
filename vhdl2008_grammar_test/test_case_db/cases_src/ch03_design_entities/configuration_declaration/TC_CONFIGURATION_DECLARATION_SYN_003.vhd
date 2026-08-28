-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Nested block_configuration: the outer for binds the architecture, the inner nested for...use binds component instances to entity/architecture pairs, verifying block_configuration in a configuration can contain multi-level nested component_configuration bindings
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity or2 is
  port (x1,x2:in bit; z:out bit);
end entity or2;

architecture beh of or2 is
begin
end architecture beh;

entity cfg_nest_ent is
  port(a,b:in bit; y_and,y_or:out bit);
end entity;
architecture rtl of cfg_nest_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  component or2  is port(x1,x2:in bit; z:out bit); end component;
  signal s_and,s_or:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s_and);
  u_or:or2  port map(x1=>a,x2=>b,z=>s_or);
  y_and<=s_and; y_or<=s_or;
end architecture;
configuration cfg_nest of cfg_nest_ent is
  for rtl
    for u_and:and2 use entity work.and2(rtl);
    end for;
    for u_or:or2  use entity work.or2(beh);
    end for;
  end for;
end configuration cfg_nest;
