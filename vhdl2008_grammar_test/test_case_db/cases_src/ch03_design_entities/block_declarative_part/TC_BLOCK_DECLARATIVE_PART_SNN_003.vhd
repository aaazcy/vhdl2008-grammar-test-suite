-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: block_declarative_part: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_declarati_e3 is end entity;
architecture bh of block_declarati_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;