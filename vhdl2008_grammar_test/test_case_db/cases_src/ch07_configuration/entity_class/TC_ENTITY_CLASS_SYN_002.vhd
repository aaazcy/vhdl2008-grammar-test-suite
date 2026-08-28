-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Positive
-- Test Focus: Entity class "variable" and "label" in attribute specification — exercises variable and label entity classes within attribute_specification context using process variables and instance labels
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ec_var_label is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of ec_var_label is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  attribute timing : time;
  attribute timing of u_and : label is 2 ns;
  signal s_out : bit := '0';
begin
  process(a, b)
    variable v_tmp : bit;
    attribute keep : boolean;
    attribute keep of v_tmp : variable is true;
  begin
    v_tmp := a and b;
    s_out <= v_tmp;
  end process;
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture bh;
