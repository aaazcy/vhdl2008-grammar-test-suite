-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Component with port_clause only (no generic_clause). Exercises four port modes — in, out, inout, buffer — with bit and bit_vector types. Uses multi-line port layout. No generic_clause, end component without simple_name.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_ports_ent is
  port(clk  : in  bit;
       dout : out bit_vector(7 downto 0));
end entity comp_ports_ent;

architecture bh of comp_ports_ent is
  component comp_bus_if is
    port(
      clk   : in    bit;
      req   : inout bit;
      ack   : buffer bit;
      data  : out   bit_vector(7 downto 0)
    );
  end component;
  signal s_req, s_ack : bit;
begin
  s_req <= clk;
  dout <= (others => '0');
end architecture bh;
