-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Syntactically invalid component_declaration — port_clause uses comma as separator between port elements. Like generic_clause, the port list requires semicolons between interface element declarations. Error at the comma after the first port element.
-- Expected Result: Triggers syntax error — invalid delimiter in port clause
-- Dependencies: None
-- =============================================================
entity comp_snn5_ent is
  port(a : in bit; y : out bit);
end entity comp_snn5_ent;

architecture bh of comp_snn5_ent is
  component comp_portdelim is
    port(
      clk : in bit,               -- ERROR: comma invalid separator, ';' required
      q   : out bit
    );
  end component;
begin
  y <= a;
end architecture bh;
