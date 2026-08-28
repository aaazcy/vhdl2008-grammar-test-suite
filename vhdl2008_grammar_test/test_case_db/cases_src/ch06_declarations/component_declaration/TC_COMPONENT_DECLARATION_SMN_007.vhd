-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SMN_007
-- Rule Type: Semantic
-- Related Rule ID: SEM_COMP_END_NAME_MISMATCH
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Rule Description: When a component_simple_name is provided after 'end component', it must lexically match the component identifier declared at the start of the declaration. Mismatched names violate the scope and naming consistency rules.
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Component is declared with identifier 'comp_alice' but the end component clause specifies 'comp_bob'. The grammar permits any identifier in the end clause, but semantic rules require an exact match with the opening identifier.
-- Expected Result: Triggers semantic error — component name mismatch at end clause
-- Dependencies: None
-- =============================================================
entity comp_sem7_ent is
  port(a : in bit; y : out bit);
end entity comp_sem7_ent;

architecture bh of comp_sem7_ent is
  component comp_alice is
    port(clk : in bit; q : out bit);
  end component comp_bob;        -- ERROR: 'comp_bob' does not match 'comp_alice'
begin
  y <= a;
end architecture bh;
