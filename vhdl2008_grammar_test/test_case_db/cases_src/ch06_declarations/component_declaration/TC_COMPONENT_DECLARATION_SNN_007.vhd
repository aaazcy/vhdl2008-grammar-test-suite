-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Syntactically invalid component_declaration — the terminating clause has 'end' but is missing the required 'component' keyword. The production mandates 'end component' as a compound keyword pair. Error at the semicolon where 'component' was expected after 'end'.
-- Expected Result: Triggers syntax error — missing 'component' after 'end'
-- Dependencies: None
-- =============================================================
entity comp_snn7_ent is
  port(a : in bit; y : out bit);
end entity comp_snn7_ent;

architecture bh of comp_snn7_ent is
  component comp_nocomp is
    port(clk : in bit; q : out bit);
  end;                           -- ERROR: missing 'component' after 'end'
begin
  y <= a;
end architecture bh;
