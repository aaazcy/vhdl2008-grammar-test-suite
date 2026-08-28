-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_003
-- Rule Type: Syntax
-- BNF Production: ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive
-- Test Focus: Entity aspect "open" alternative — exercises "use open" to leave component instances unbound, testing the third alternative of entity_aspect
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity easp_open_form is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of easp_open_form is
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for all : gate_or use open;
begin
  u_or1 : gate_or port map(x1=>a, x2=>b, z=>y1);
  u_or2 : gate_or port map(x1=>c, x2=>d, z=>y2);
end architecture bh;
