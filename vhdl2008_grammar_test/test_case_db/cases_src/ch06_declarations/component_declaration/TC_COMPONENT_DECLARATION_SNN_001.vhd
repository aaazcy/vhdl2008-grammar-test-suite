-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Syntactically invalid component_declaration — missing the mandatory 'component' keyword. The declaration begins directly with an identifier where the parser expects 'component'. File is parseable up to the unexpected 'comp_bad' identifier.
-- Expected Result: Triggers syntax error — missing 'component' keyword
-- Dependencies: None
-- =============================================================
entity comp_snn1_ent is
  port(a : in bit; y : out bit);
end entity comp_snn1_ent;

architecture bh of comp_snn1_ent is
  comp_bad is                    -- ERROR: missing 'component' keyword
    port(clk : in bit; q : out bit);
  end component;
begin
  y <= a;
end architecture bh;
