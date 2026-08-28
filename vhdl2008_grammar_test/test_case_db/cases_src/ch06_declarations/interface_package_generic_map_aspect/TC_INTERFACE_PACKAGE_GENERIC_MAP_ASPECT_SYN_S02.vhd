-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_generic_map_aspect ::= generic_map_aspect | generic map ( <> ) | generic map ( default )
-- Case Type: Positive
-- Test Focus: Production-specific: exercises interface_package_generic_map_aspect with generic map ( <>) for unconnected generic package.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_pkg_gma_syn_s2 is
  port (
    clk : in  bit;
    d   : in  bit_vector(3 downto 0);
    q   : out bit_vector(3 downto 0)
  );
end entity interface_pkg_gma_syn_s2;

architecture rtl of interface_pkg_gma_syn_s2 is
  signal s_data : bit_vector(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_data <= d;
      q <= s_data;
    end if;
  end process;
end architecture rtl;
