-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Complete component_declaration with all optional elements: 'is' keyword, generic_clause with integer and time defaults, port_clause with in/out/inout modes using generic-dependent bit_vector widths, and end component with matching component_simple_name. Exercises the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_full_ent is
  port(clk : in bit; rst : in bit; q : out bit_vector(3 downto 0));
end entity comp_full_ent;

architecture bh of comp_full_ent is
  component comp_counter is
    generic(WIDTH : integer := 4; PERIOD : time := 20 ns);
    port(
      clk   : in    bit;
      rst   : in    bit;
      load  : inout bit;
      count : out   bit_vector(WIDTH-1 downto 0)
    );
  end component comp_counter;
  signal s_load : bit;
begin
  s_load <= '0';
  q <= (others => '0');
end architecture bh;
