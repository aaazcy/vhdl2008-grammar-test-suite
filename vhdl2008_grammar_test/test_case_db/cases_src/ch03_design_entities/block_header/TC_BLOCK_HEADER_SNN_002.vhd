-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: block_header: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_header_e2 is end entity;
architecture bh of block_header_e2 is
  -- ERROR: invalid syntax in block_header
  signal s : bit;
begin
  s <= '1'
end architecture bh;