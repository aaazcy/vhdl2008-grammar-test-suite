-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Configuration declaration ending with end, omitting the configuration keyword and simple_name: verifying that both [ configuration ] and [ configuration_simple_name ] after end in the syntax are optional and the minimal ending form compiles
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity and2 is
  port (x1,x2:in bit; z:out bit);
end entity and2;

architecture rtl of and2 is
begin
end architecture rtl;

entity cfg_endmin_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of cfg_endmin_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s); y<=s;
end architecture;
configuration cfg_endmin of cfg_endmin_ent is
  for rtl
    for u_and:and2 use entity work.and2(rtl);
    end for;
  end for;
end;
