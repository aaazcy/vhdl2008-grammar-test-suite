-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: for clause in block_configuration missing the matching end for: the inner for u_inv:inv... opens a for but encounters end configuration without being closed by end for, verifying the parser triggers an error when it detects an unclosed for-end for pairing
-- Expected Result: Triggers syntax error: unclosed "for" in block_configuration
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_noendfor_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_noendfor_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
-- ERROR: inner for missing matching end for
configuration cfg_noendfor of cfg_noendfor_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
end configuration cfg_noendfor;
