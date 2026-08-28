-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Missing "end configuration" closing marker: the configuration body contains a complete block_configuration but lacks the closing keyword end, the file ends directly after block_configuration, verifying the parser triggers an error when it expects end at the end of the configuration body but encounters EOF
-- Expected Result: Triggers syntax error: missing "end" for configuration declaration
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_noend_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_noend_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
-- ERROR: missing end configuration
configuration cfg_noend of cfg_noend_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
