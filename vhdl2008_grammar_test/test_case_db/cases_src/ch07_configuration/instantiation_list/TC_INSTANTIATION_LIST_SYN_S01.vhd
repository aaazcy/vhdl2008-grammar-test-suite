-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Test Focus: Instantiation list production-specific: demonstrates all three alternatives — single label, "others", and "all" — in component_specification context for different component types
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

entity gate_or is
  port (x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture beh of gate_or is
begin
end architecture beh;

entity il_prod_specific is
  port(a,b,c,d,e,f : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of il_prod_specific is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and1 : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y1);
  for all : gate_or use entity work.gate_or(beh)
    port map(x1=>a, x2=>b, z=>y2);
  for others : gate_and use open;
begin
  u_and1 : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_and2 : gate_and port map(x1=>c, x2=>d, z=>open);
  u_or1 : gate_or port map(x1=>e, x2=>f, z=>y2);
  u_or2 : gate_or port map(x1=>a, x2=>c, z=>y3);
end architecture bh;
