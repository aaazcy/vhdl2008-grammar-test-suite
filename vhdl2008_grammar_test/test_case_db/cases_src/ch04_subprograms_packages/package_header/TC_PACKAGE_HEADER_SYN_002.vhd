-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header: generic_clause with generic_map_aspect — exercises the full optional syntax of package_header: generic_clause followed by generic_map_aspect terminated with semicolon, showing the VHDL-2008 generic package header pattern
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_header_generic_map is
  generic (
    G_WIDTH : positive := 8;
    G_DEPTH : positive := 256
  );
  port (
    wr_en   : in  bit;
    data_in : in  bit_vector(G_WIDTH - 1 downto 0);
    full    : out boolean
  );
end entity;

architecture test of pkg_header_generic_map is
  -- Simulates a package with generic header being used:
  -- package pkg_generic is
  --   generic (G_WIDTH : positive; G_DEPTH : positive);
  --   generic map (G_WIDTH => 8, G_DEPTH => 256);
  --   ... declarative items ...
  -- end package;

  constant C_MAX : natural := G_WIDTH * G_DEPTH;
  signal s_count : natural := 0;
begin
  process(wr_en) is
  begin
    if wr_en = '1' and s_count < C_MAX then
      s_count <= s_count + 1;
    end if;
  end process;
  full <= s_count >= C_MAX;
end architecture test;
