-- =============================================================
-- Case ID: TC_PORT_MAP_ASPECT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: port_map_aspect ::= port map ( port_association_list )
-- Case Type: Positive
-- Test Focus: Exercises port_map_aspect with expression (not just signal name) as actual designator for input ports.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity port_map_aspect_syn4 is
  port (
    clk    : in  bit;
    sel    : in  bit;
    data   : in  bit_vector(7 downto 0);
    result : out bit_vector(7 downto 0)
  );
end entity port_map_aspect_syn4;

architecture rtl of port_map_aspect_syn4 is
  component register8 is
    port (
      clock  : in  bit;
      enable : in  bit;
      d      : in  bit_vector(7 downto 0);
      q      : out bit_vector(7 downto 0)
    );
  end component;
  signal s_en : bit;
begin
  s_en <= clk and sel;
  -- port_map_aspect with expression as actual (not clk, not sel)
  u_reg : register8
    port map (
      clock  => clk,
      enable => s_en,
      d      => data xor "10101010",
      q      => result
    );
end architecture rtl;
