-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: block_header with generic_clause + generic_map_aspect (single generic): the block declares generic(DELAY:time:=1ns) and provides the actual value 500ps via generic map, verifying that generic_map explicitly overrides the default value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bhdr_gmap_ent is
  port(sig_in : in bit; sig_out : out bit);
end entity;
architecture bh of bhdr_gmap_ent is
  signal s_delayed : bit;
begin
  b_gmap : block
    generic(DELAY : time := 1 ns);
    generic map(DELAY => 500 ps);
  begin
    s_delayed <= sig_in after DELAY;
    sig_out <= s_delayed;
  end block;
end architecture bh;
