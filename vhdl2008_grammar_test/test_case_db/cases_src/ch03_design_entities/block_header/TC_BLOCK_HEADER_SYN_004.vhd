-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: block_header with only generic_clause and no generic_map — declares generic(WIDTH:integer) without providing a generic_map, verifying that generic_map is an optional component and the block uses the generic default value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bhdr_gonly_ent is
  port(data_in : in bit_vector(7 downto 0); msb_out : out bit);
end entity;
architecture bh of bhdr_gonly_ent is
begin
  b_gonly : block
    generic(WIDTH : integer := 8);
  begin
    msb_out <= data_in(WIDTH - 1);
  end block;
end architecture bh;
