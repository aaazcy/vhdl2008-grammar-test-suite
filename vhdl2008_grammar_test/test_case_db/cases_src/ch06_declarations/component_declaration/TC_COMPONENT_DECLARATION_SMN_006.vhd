-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SMN_006
-- Rule Type: Semantic
-- Related Rule ID: SEM_COMP_GENERIC_TYPE_MISMATCH
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Rule Description: The default expression in a generic declaration must be type-compatible with the declared generic type. Assigning a string literal to an integer generic violates type checking rules.
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Component generic_clause declares an integer generic 'W' but provides a string literal "hello" as the default expression. The declaration is syntactically valid but fails semantic type checking during elaboration.
-- Expected Result: Triggers semantic error — type mismatch in generic default expression
-- Dependencies: None
-- =============================================================
entity comp_sem6_ent is
  port(a : in bit; y : out bit);
end entity comp_sem6_ent;

architecture bh of comp_sem6_ent is
  component comp_bad_default is
    generic(
      W : integer := "hello"     -- ERROR: string default for integer generic
    );
    port(clk : in bit; q : out bit);
  end component;
begin
  y <= a;
end architecture bh;
