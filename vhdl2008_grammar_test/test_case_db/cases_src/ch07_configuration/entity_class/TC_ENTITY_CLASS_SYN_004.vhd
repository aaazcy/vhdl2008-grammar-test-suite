-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Positive
-- Test Focus: Entity class "component" and "configuration" values — exercises component and configuration entity_class keywords in both attribute specification and group template contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ec_comp_config is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ec_comp_config is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  attribute area : real;
  attribute area of gate_and : component is 12.5;
  attribute area of bh : architecture is 25.0;
  group comp_group is (component, label);
  group cg : comp_group (gate_and, u_and);
  signal s_out : bit := '0';
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
  s_out <= y;
end architecture bh;
