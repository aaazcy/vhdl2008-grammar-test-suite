-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SMN_005
-- Rule Type: Semantic
-- Related Rule ID: SEM_COMP_UNDEFINED_TYPE
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Rule Description: Port types used in a component declaration must be visible at the point of the declaration. Type names that are not declared in any reachable scope cause an elaboration error.
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: Component port_clause references a type 't_undefined' that has never been declared in any visible scope. The component_declaration is syntactically well-formed but fails during name resolution because the type identifier cannot be bound.
-- Expected Result: Triggers semantic error — undeclared type in port clause
-- Dependencies: None
-- =============================================================
entity comp_sem5_ent is
  port(a : in bit; y : out bit);
end entity comp_sem5_ent;

architecture bh of comp_sem5_ent is
  component comp_bad_type is
    port(
      clk : in  t_undefined;      -- ERROR: type 't_undefined' not declared in scope
      q   : out bit
    );
  end component;
begin
  y <= a;
end architecture bh;
