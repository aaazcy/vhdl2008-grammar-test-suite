-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Component with generic_clause only (no port_clause). Generics of mixed types — integer with default and time with default. Exercises comma-separated generic list syntax within the component body. End component without simple_name.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_gen_ent is
  port(trig : in bit; done : out bit);
end entity comp_gen_ent;

architecture bh of comp_gen_ent is
  component comp_timer is
    generic(DELAY : time := 10 ns; COUNT : integer := 5);
  end component;
  signal s_done : bit := '0';
begin
  s_done <= trig after 10 ns;
  done <= s_done;
end architecture bh;
