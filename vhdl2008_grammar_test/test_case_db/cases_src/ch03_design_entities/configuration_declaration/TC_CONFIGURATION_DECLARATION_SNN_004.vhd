-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Negative
-- Test Focus: configuration_simple_name at end does not match the declaration header: declared as configuration cfg_one ... end configuration cfg_two, cfg_two does not equal cfg_one, verifying the analyzer triggers an error when it detects the name mismatch
-- Expected Result: Triggers syntax error: mismatched configuration name at end
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_name_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_name_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
-- ERROR: cfg_two does not match cfg_one
configuration cfg_one of cfg_name_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
  end for;
end configuration cfg_two;
