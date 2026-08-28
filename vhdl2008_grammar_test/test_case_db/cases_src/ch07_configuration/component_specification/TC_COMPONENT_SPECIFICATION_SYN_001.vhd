-- =============================================================
-- Case ID: TC_COMPONENT_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: component_specification ::= instantiation_list : component_name
-- Case Type: Positive
-- Test Focus: Component spec single+multiple+all+others: u1:comp(single label) / u1,u2:comp(multiple labels) / all:comp(all instances) / others:comp(remaining instances)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity or2 is
  port (x1,x2:in bit; z:out bit);
end entity or2;

architecture beh of or2 is
begin
end architecture beh;

entity cs_ent is port(a,b:in bit; y_and,y_or:out bit); end entity;
architecture rtl of cs_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  component or2  is port(x1,x2:in bit; z:out bit); end component;
  for u_and:and2 use entity work.and2(rtl);
  for all:or2 use entity work.or2(beh);
  signal s_a,s_o1,s_o2:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s_a); y_and<=s_a;
  u_or1:or2 port map(x1=>a,x2=>b,z=>s_o1); u_or2:or2 port map(x1=>s_a,x2=>b,z=>s_o2); y_or<=s_o1 or s_o2;
end architecture;
