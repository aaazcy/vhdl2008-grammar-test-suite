-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Syntactically invalid component_declaration — the terminating 'end component' clause is entirely missing. The declaration opens correctly with 'component' and a valid port_clause, but no 'end component;' is provided. Error triggered when the next construct (signal declaration or 'begin') is encountered where 'end component' was expected. File is parseable through the valid port_clause.
-- Expected Result: Triggers syntax error — missing 'end component' clause
-- Dependencies: None
-- =============================================================
entity comp_snn2_ent is
  port(a : in bit; y : out bit);
end entity comp_snn2_ent;

architecture bh of comp_snn2_ent is
  component comp_unterm is
    port(
      clk : in  bit;
      q   : out bit
    );
  -- ERROR: 'end component' missing — unexpected next declaration
  signal s : bit;
begin
  y <= a;
end architecture bh;
