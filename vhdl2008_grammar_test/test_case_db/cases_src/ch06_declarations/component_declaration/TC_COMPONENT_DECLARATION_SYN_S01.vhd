-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Test Focus: Component declaration: component identifier [is] [generic_clause] [port_clause] end component [identifier];
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_component_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_component_declaration_syn_s01 is
  component comp_fifo is
    generic(WIDTH:integer:=8; DEPTH:integer:=16);
    port(clk:in bit; rst:in bit; din:in bit_vector(WIDTH-1 downto 0);
         dout:out bit_vector(WIDTH-1 downto 0));
  end component;
begin
  r<=42;end architecture bh;
