-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Positive
-- Test Focus: Instantiation list "all" alternative — exercises "for all : component_name" to bind every instance of a component in one configuration specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity il_all_form is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of il_all_form is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for all : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y1);
begin
  u_and1 : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_and2 : gate_and port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
