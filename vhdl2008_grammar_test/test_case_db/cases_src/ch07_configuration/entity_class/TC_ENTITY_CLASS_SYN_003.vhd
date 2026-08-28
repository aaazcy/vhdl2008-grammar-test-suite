-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Positive
-- Test Focus: Entity class values in group template declaration — exercises component, type, signal, label, variable entity_class values within group template context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ec_group_template is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ec_group_template is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  signal s_local : bit := '0';
  attribute pin_name : string;
  attribute pin_name of u_and : label is "and_gate_inst";
  attribute pin_name of s_local : signal is "feedback";
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
  s_local <= not y;
end architecture bh;
