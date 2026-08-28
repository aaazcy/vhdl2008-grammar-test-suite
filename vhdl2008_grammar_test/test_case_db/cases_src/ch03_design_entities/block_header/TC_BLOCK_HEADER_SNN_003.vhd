-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: block_header: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_header_e3 is end entity;
architecture bh of block_header_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;