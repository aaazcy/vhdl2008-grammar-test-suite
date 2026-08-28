-- =============================================================
-- Case ID: TC_GENERIC_MAP_ASPECT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: generic_map_aspect ::= generic map ( generic_association_list )
-- Case Type: Positive
-- Test Focus: Exercises generic_map_aspect with named association overriding default generic values in a component instantiation.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity generic_map_aspect_syn3 is
  port (
    clk    : in  bit;
    data   : in  bit_vector(7 downto 0);
    result : out bit_vector(7 downto 0)
  );
end entity generic_map_aspect_syn3;

architecture rtl of generic_map_aspect_syn3 is
  component shift_reg is
    generic (
      WIDTH  : integer := 8;
      STAGES : integer := 4
    );
    port (
      clock : in  bit;
      d_in  : in  bit_vector(WIDTH-1 downto 0);
      d_out : out bit_vector(WIDTH-1 downto 0)
    );
  end component;
begin
  -- generic_map_aspect overriding default generics
  u_sr1 : shift_reg
    generic map (
      WIDTH  => 8,
      STAGES => 2
    )
    port map (
      clock => clk,
      d_in  => data,
      d_out => result
    );
end architecture rtl;
