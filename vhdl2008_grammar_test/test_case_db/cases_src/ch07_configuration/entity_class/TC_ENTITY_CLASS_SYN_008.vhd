-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Positive
-- Test Focus: combined use of entity class "group" and "constant" in a group template declaration — the group and constant keywords used in the entity class list of the group template, verifies the group template supports combining multiple entity_class values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ec_group_constant is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of ec_group_constant is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>a, z=>y);
  constant C_DELAY : time := 2 ns;
  signal s_int : bit := '0';
  attribute pin : string;
  attribute pin of u_and : label is "A1";
  group pin_group is (label, signal);
  group pg : pin_group (u_and, s_int);
  attribute pin of pg : group is "grp1";
begin
  u_and : gate_and port map(x1=>a, x2=>a, z=>y);
  s_int <= y after C_DELAY;
end architecture rtl;
