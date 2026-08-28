-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: block_header implicitly empty — the block declares neither generic_clause nor generic_map_aspect, verifying the zero-element form where block_header is entirely optional (all optional in the BNF)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bhdr_empty_ent is
  port(x : in bit; z : out bit);
end entity;
architecture bh of bhdr_empty_ent is
begin
  b_empty : block
    signal s_buf : bit;
  begin
    s_buf <= x;
    z <= s_buf;
  end block;
end architecture bh;
