-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: port_clause of component_declaration missing the closing parenthesis - in component comp_nomode the port list has end component directly after the interface declaration without ')', verifying the interface list of port_clause requires a closing parenthesis
-- Expected Result: Triggers syntax error: ';' or ')' expected after interface
-- Dependencies: None
-- =============================================================
entity comp_ent is
  port(a : in bit; y : out bit);
end entity comp_ent;

architecture bh of comp_ent is
  component comp_nomode is
    port(clk : in bit; q : out bit
  end component;
begin
  y <= a;
end architecture bh;
