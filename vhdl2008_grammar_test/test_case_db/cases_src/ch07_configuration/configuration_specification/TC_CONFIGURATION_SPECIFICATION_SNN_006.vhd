-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Negative
-- Test Focus: Empty instantiation_label in simple form — "for : gate_and" has no label before the colon, which violates the instantiation_list grammar within component_specification; at least one label, "others", or "all" is required
-- Expected Result: Triggers syntax error (missing instantiation label)
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity confspec_snn6_ent is port(r:out integer); end entity;
architecture bh of confspec_snn6_ent is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  -- ERROR: empty instantiation_list before colon
  for : gate_and use entity work.gate_and(rtl)
    port map(x1=>'0', x2=>'0', z=>open);
  end for;
  signal s:integer:=0;
begin
  u_and : gate_and port map(x1=>'0', x2=>'0', z=>open);
  r<=s;
end architecture bh;
