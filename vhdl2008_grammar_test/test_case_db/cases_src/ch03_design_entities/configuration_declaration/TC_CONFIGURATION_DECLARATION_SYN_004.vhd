-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Binding indication with generic map: the entity_aspect of the for...use clause in block_configuration uses generic map to override the generic defaults of the component, verifying configuration binding supports the generic map syntax for passing generic parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adder is
  generic(w:positive);
  port(x1,x2:in bit_vector(w-1 downto 0); z:out bit_vector(w-1 downto 0));
end entity adder;

architecture rtl of adder is
begin
end architecture rtl;


entity cfg_genmap_ent is
  port(a,b:in bit_vector(3 downto 0); y:out bit_vector(3 downto 0));
end entity;
architecture rtl of cfg_genmap_ent is
  component adder is
    generic(w:positive);
    port(x1,x2:in bit_vector(w-1 downto 0); z:out bit_vector(w-1 downto 0));
  end component;
  signal s:bit_vector(3 downto 0);
begin
  u_add:adder generic map(w=>4) port map(x1=>a,x2=>b,z=>s); y<=s;
end architecture;
configuration cfg_genmap of cfg_genmap_ent is
  for rtl
    for u_add:adder use entity work.adder(rtl)
      generic map(w=>4);
    end for;
  end for;
end configuration cfg_genmap;
