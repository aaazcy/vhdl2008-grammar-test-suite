-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Component with generic_clause only (no port_clause) and end component includes the component_simple_name. No 'is' keyword. Exercises the generic+end-identifier combination without ports, verifying all three tokens of the end clause.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_gen_named_ent is
  port(start : in bit; ready : out bit);
end entity comp_gen_named_ent;

architecture bh of comp_gen_named_ent is
  component comp_delay
    generic(T : time := 5 ns; N : integer := 3);
  end component comp_delay;
  signal s_ready : bit;
begin
  s_ready <= start after 5 ns;
  ready <= s_ready;
end architecture bh;
