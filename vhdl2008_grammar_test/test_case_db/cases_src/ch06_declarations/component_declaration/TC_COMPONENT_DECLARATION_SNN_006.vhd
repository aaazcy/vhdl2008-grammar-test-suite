-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Syntactically invalid component_declaration — missing semicolon after 'end component'. The production requires a terminating semicolon after the closing clause. Error at the next token ('begin') where ';' is expected. File is parseable through the complete component body up to the missing semicolon.
-- Expected Result: Triggers syntax error — missing semicolon after 'end component'
-- Dependencies: None
-- =============================================================
entity comp_snn6_ent is
  port(a : in bit; y : out bit);
end entity comp_snn6_ent;

architecture bh of comp_snn6_ent is
  component comp_nosemi is
    port(clk : in bit; q : out bit);
  end component                   -- ERROR: missing ';' after 'end component'
begin
  y <= a;
end architecture bh;
