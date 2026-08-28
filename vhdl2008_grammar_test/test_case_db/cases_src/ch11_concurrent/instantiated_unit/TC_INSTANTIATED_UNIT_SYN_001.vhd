-- =============================================================
-- Case ID: TC_INSTANTIATED_UNIT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATED_UNIT
-- Standard Reference: IEEE 1076-2008 Section 11.7
-- Production: instantiated_unit ::= [ component ] component_name | entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name
-- Case Type: Positive
-- Test Focus: Instantiated unit three forms: direct component instantiation / direct entity+arch instantiation / configuration instantiation, verifying that a component_instantiation can bind a component declaration, a direct entity/arch binding or a configuration binding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iu_ent is port(a,b:in bit; y_and,y_or:out bit); end entity;

-- Supporting design unit for the direct entity instantiation
entity or2 is
  port(x1, x2 : in bit; z : out bit);
end entity or2;
architecture beh of or2 is
begin
  z <= x1 or x2;
end architecture beh;

architecture bh of iu_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s_and,s_or:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s_and);
  u_or:entity work.or2(beh) port map(x1=>a,x2=>b,z=>s_or);
  y_and<=s_and; y_or<=s_or;
end architecture bh;
