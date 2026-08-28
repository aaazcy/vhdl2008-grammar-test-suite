-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive
-- Test Focus: binding_indication with configuration entity_aspect and generic_map_aspect — exercises the "use configuration" entity_aspect alternative combined with a generic map for overriding generics, proving both optional clauses can coexist with a configuration entity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Supporting design units for the configuration referenced by the binding indication
entity reg_8bit_ent is
  generic(LATENCY : integer := 1);
  port(d : in bit_vector(7 downto 0); q : out bit_vector(7 downto 0));
end entity reg_8bit_ent;

architecture rtl of reg_8bit_ent is
begin
  q <= d;
end architecture rtl;

configuration reg_8bit_cfg of reg_8bit_ent is
  for rtl
  end for;
end configuration reg_8bit_cfg;

entity bi_cfg_generic is
  port(din : in bit_vector(7 downto 0); dout : out bit_vector(7 downto 0));
end entity;

architecture bh of bi_cfg_generic is
  component reg_8bit is
    generic(LATENCY : integer := 1);
    port(d : in bit_vector(7 downto 0); q : out bit_vector(7 downto 0));
  end component;
  for u_reg : reg_8bit use configuration work.reg_8bit_cfg
    generic map(LATENCY => 2);
begin
  u_reg : reg_8bit port map(d=>din, q=>dout);
end architecture bh;
