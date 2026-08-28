-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Configuration declarative part with use clause + attribute specification: configuration_declarative_part imports a library use clause and specifies an attribute for a label, verifying the configuration declarative part supports use clause and attribute specification as declarative items
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

entity cfg_decl_ent is
  port(a,b:in bit; y_and,y_or:out bit);
  attribute cfg_style:string;
end entity;
architecture rtl of cfg_decl_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  component or2  is port(x1,x2:in bit; z:out bit); end component;
  signal s_and,s_or:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s_and);
  u_or:or2  port map(x1=>a,x2=>b,z=>s_or);
  y_and<=s_and; y_or<=s_or;
end architecture;
configuration cfg_decl of cfg_decl_ent is
  use std.standard.all;
  attribute cfg_style of all:architecture is "mixed";
  for rtl
    for u_and:and2 use entity work.and2(rtl);
    end for;
    for u_or:or2   use entity work.or2(beh);
    end for;
  end for;
end configuration cfg_decl;
