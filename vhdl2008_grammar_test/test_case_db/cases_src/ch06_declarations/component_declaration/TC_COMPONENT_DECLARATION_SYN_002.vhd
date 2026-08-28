-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Minimal component_declaration — only mandatory tokens: 'component', identifier, 'end component'. No optional 'is', no generic_clause, no port_clause, no component_simple_name after end component. Exercises the shortest grammatically valid form of the production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_min_ent is
  port(inp : in bit; outp : out bit);
end entity comp_min_ent;

architecture bh of comp_min_ent is
  component comp_passthru
  end component;
  signal s_int : bit;
begin
  s_int <= inp;
  outp <= s_int;
end architecture bh;
