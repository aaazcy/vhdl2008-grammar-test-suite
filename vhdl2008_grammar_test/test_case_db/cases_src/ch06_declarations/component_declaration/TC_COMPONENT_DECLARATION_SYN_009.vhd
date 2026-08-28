-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Multiple component declarations in a single architecture declarative part. Four distinct declarations exercise different combinations of optional clauses: minimal (bare), generic-only, port-only, and full generic+port with end component simple_name. Verifies the parser handles consecutive component_declarations without interference.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_multi_ent is
  port(clk : in bit; q : out bit_vector(3 downto 0));
end entity comp_multi_ent;

architecture bh of comp_multi_ent is
  component comp_min
  end component;
  component comp_gen is
    generic(N : integer := 8);
  end component comp_gen;
  component comp_ports is
    port(clk : in bit; d : out bit);
  end component;
  component comp_full is
    generic(W : integer := 4);
    port(clk : in bit; q : out bit_vector(W-1 downto 0));
  end component comp_full;
  signal s_d : bit;
begin
  q <= (others => '0');
end architecture bh;
