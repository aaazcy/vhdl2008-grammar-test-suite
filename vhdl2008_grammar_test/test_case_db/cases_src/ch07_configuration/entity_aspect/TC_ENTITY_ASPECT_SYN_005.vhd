-- =============================================================
-- Case ID: TC_ENTITY_ASPECT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: entity_aspect ::= entity entity_name [ ( architecture_identifier ) ] | configuration configuration_name | open
-- Case Type: Positive
-- Test Focus: entity entity_name without the optional architecture_identifier - only "entity work.gate_and" is specified without an architecture name in parentheses, verifying architecture_identifier is an optional clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity easp_no_arch_id is
  port(a,b : in bit; y : out bit);
end entity;

architecture rtl of easp_no_arch_id is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and
    port map(x1=>a, x2=>b, z=>y);
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
end architecture rtl;
