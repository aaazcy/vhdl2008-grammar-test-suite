-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Negative
-- Test Focus: Syntactically invalid component_declaration — generic_clause uses comma as separator between generic declarations. VHDL generic and port interface lists require semicolons as element separators, not commas. Error at the comma after the first generic element.
-- Expected Result: Triggers syntax error — invalid delimiter in generic clause
-- Dependencies: None
-- =============================================================
entity comp_snn4_ent is
  port(a : in bit; y : out bit);
end entity comp_snn4_ent;

architecture bh of comp_snn4_ent is
  component comp_gendelim is
    generic(
      W : integer := 8,           -- ERROR: comma invalid separator, ';' required
      D : integer := 16
    );
    port(clk : in bit; q : out bit);
  end component;
begin
  y <= a;
end architecture bh;
