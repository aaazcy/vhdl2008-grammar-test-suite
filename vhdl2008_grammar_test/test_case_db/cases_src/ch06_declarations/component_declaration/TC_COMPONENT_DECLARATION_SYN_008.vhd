-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Component exercising all five port modes — in, out, inout, buffer, linkage — in a single port_clause. No generic_clause. Tests that the parser accepts every mode keyword in the component port context. End component without simple_name.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_allmodes_ent is
  port(clk  : in  bit;
       dout : out bit_vector(3 downto 0));
end entity comp_allmodes_ent;

architecture bh of comp_allmodes_ent is
  component comp_five_modes is
    port(
      p_in     : in      bit;
      p_out    : out     bit;
      p_inout  : inout   bit;
      p_buffer : buffer  bit;
      p_link   : linkage bit
    );
  end component comp_five_modes;
  signal s_io, s_buf, s_link : bit;
begin
  s_io <= clk;
  dout <= (others => '0');
end architecture bh;
