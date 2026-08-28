-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Component with the optional 'is' keyword present, no generic_clause, no port_clause, and no component_simple_name after 'end component'. Verifies the parser correctly handles 'is' as an isolated optional token within the production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_is_ex_ent is
  port(a : in bit; y : out bit);
end entity comp_is_ex_ent;

architecture bh of comp_is_ex_ent is
  component comp_buf is
  end component;
  signal s_buf : bit;
begin
  s_buf <= a;
  y <= s_buf;
end architecture bh;
