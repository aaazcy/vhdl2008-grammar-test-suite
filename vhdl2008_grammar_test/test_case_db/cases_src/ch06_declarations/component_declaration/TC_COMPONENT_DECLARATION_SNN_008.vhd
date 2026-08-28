-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SNN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Syntactically invalid component_declaration — port element missing the type specification. A port 'clk' has mode 'in' but no type/subtype_indication follows. The interface_element production requires both mode and type. Error at the closing parenthesis or next element where a type was expected.
-- Expected Result: Triggers syntax error — missing type in port element
-- Dependencies: None
-- =============================================================
entity comp_snn8_ent is
  port(a : in bit; y : out bit);
end entity comp_snn8_ent;

architecture bh of comp_snn8_ent is
  component comp_notype is
    port(
      clk : in;                   -- ERROR: missing type after mode keyword
      q   : out bit
    );
  end component;
begin
  y <= a;
end architecture bh;
