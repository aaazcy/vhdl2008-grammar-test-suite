-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header: generic_clause without generic_map_aspect — exercises the case where generic_clause is present but generic_map_aspect is omitted; the ';' after generic_map_aspect is not needed because generic_map_aspect is optional and bracketed
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_header_generic_only is
  generic (
    G_DATA_BITS : natural := 32
  );
  port (
    data_in  : in  bit_vector(G_DATA_BITS - 1 downto 0);
    lsb_only : out bit
  );
end entity;

architecture test of pkg_header_generic_only is
  constant C_LSB_IDX : natural := 0;
begin
  lsb_only <= data_in(C_LSB_IDX);
end architecture test;
