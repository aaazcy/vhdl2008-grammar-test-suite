-- =============================================================
-- Case ID: TC_GENERIC_MAP_ASPECT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: generic_map_aspect ::= generic map ( generic_association_list )
-- Case Type: Positive
-- Test Focus: Exercises generic_map_aspect with open association for an unneeded generic parameter.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity generic_map_aspect_syn4 is
  port (
    clk  : in  bit;
    d    : in  bit_vector(3 downto 0);
    q    : out bit_vector(3 downto 0)
  );
end entity generic_map_aspect_syn4;

architecture rtl of generic_map_aspect_syn4 is
  component reg_file is
    generic (
      DEPTH : integer := 16;
      WIDTH : integer := 4
    );
    port (
      clock   : in  bit;
      wr_data : in  bit_vector(WIDTH-1 downto 0);
      rd_data : out bit_vector(WIDTH-1 downto 0)
    );
  end component;
begin
  u_rf : reg_file
    generic map (
      DEPTH => 8,
      WIDTH => 4
    )
    port map (
      clock   => clk,
      wr_data => d,
      rd_data => q
    );
end architecture rtl;
