-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive
-- Test Focus: Both simple and compound forms coexist in same architecture — exercises that multiple configuration_specification instances of both alternatives work together for different components
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_nor is
  port (x1,x2 : in bit; z : out bit);
end entity gate_nor;

architecture beh of gate_nor is
begin
end architecture beh;

entity gate_or is
  port (x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture rtl of gate_or is
begin
end architecture rtl;

entity confspec_both_forms is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of confspec_both_forms is
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_nor is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- simple form for gate_or
  for u_or1 : gate_or use entity work.gate_or(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  end for;
  -- compound form for gate_nor
  for u_nor1 : gate_nor use entity work.gate_nor(beh)
    port map(x1=>c, x2=>d, z=>y2);
    use vunit nor_check;
  end for;
begin
  u_or1 : gate_or port map(x1=>a, x2=>b, z=>y1);
  u_nor1 : gate_nor port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
