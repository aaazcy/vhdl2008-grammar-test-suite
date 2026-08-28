-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Test Focus: Entity class production-specific: uses entity, architecture, signal, function, component, label, constant, type classes in attribute specifications — validates multiple entity_class keywords in real attribute_specification use
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ec_prod_specific is
  port(a,b : in bit; y : out bit);
  attribute note : string;
  attribute note of ec_prod_specific : entity is "prod";
end entity;

architecture bh of ec_prod_specific is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  attribute note of bh : architecture is "beh";
  attribute note of u_and : label is "inst";
  signal s_val : bit := '0';
  attribute note of s_val : signal is "sig";
  function f_not(x:bit) return bit is begin return not x; end function;
  attribute note of f_not[bit return bit] : function is "func";
  constant C_ONE : bit := '1';
  attribute note of C_ONE : constant is "const";
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
  s_val <= f_not(y);
end architecture bh;
