-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: block_declarative_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_declarati_e2 is end entity;
architecture bh of block_declarati_e2 is
  -- ERROR: invalid syntax in block_declarative_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;