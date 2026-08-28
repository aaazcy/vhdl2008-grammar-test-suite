-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4, Section 3.4.1
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Configuration declarative part with verification_unit_binding_indication: the VHDL 2008 extended configuration_declarative_part contains a verify binding indication, verifying the declarative part supports the default verification unit binding syntax to bind a PSL verification unit to the specified entity/architecture
-- Expected Result: Compiles successfully (VHDL 2008 mode)
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity cfg_verif_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of cfg_verif_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s); y<=s;
end architecture;
configuration cfg_verif of cfg_verif_ent is
  use default verification unit and2_check;
  for rtl
    for u_and:and2 use entity work.and2(rtl);
  end for;
end configuration cfg_verif;
