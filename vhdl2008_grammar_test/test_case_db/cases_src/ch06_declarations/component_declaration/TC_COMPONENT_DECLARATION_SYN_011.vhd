-- =============================================================
-- Case ID: TC_COMPONENT_DECLARATION_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Production: component_declaration ::= component identifier [ is ] [ generic_clause ] [ port_clause ] end component [ component_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Component with boolean and bit_vector generic types plus port_clause. Exercises generic types beyond integer/time — boolean with default TRUE, and bit_vector with aggregate default. Includes 'is' keyword and end component without simple_name. Verifies the parser handles non-numeric generic types correctly.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity comp_boolgen_ent is
  port(clk  : in  bit;
       dout : out bit_vector(7 downto 0));
end entity comp_boolgen_ent;

architecture bh of comp_boolgen_ent is
  component comp_config is
    generic(
      EN_PARITY : boolean := true;
      MASK      : bit_vector(7 downto 0) := "11110000"
    );
    port(
      clk  : in  bit;
      din  : in  bit_vector(7 downto 0);
      dout : out bit_vector(7 downto 0)
    );
  end component comp_config;
  signal s_din : bit_vector(7 downto 0) := "00001111";
begin
  dout <= s_din;
end architecture bh;
