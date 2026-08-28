-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Minimal configuration declaration: configuration identifier + of entity_name + empty declarative part + block_configuration (with a single for...use binding) + end configuration, verifying the minimal compilable configuration declaration form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity cfg_min_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of cfg_min_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration cfg_min of cfg_min_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
    end for;
  end for;
end configuration cfg_min;
