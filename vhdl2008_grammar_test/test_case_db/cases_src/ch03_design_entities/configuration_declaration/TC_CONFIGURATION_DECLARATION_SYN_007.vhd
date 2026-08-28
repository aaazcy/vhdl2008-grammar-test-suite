-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Configuring an entity containing generate statements: the entity architecture uses for...generate to instantiate multiple component instances, the block_configuration of the configuration uses the same generate index range to bind each generated instance separately, verifying the configuration declaration can match a generate structure
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

entity cfg_gen_ent is
  port(a,b:in bit_vector(1 downto 0); y_and,y_or:out bit_vector(1 downto 0));
end entity;
architecture rtl of cfg_gen_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  component or2  is port(x1,x2:in bit; z:out bit); end component;
begin
  gen_and: for i in 0 to 1 generate
    u_and:and2 port map(x1=>a(i),x2=>b(i),z=>y_and(i));
  end generate;
  gen_or: for i in 0 to 1 generate
    u_or:or2 port map(x1=>a(i),x2=>b(i),z=>y_or(i));
  end generate;
end architecture;
configuration cfg_gen of cfg_gen_ent is
  for rtl
    for gen_and
      for all:and2 use entity work.and2(rtl);
      end for;
    end for;
    for gen_or
      for all:or2 use entity work.or2(beh);
      end for;
    end for;
  end for;
end configuration cfg_gen;
