-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: block_declarative_part with zero declaration items: the block has no declaration items and goes directly to the begin statement part, verifying that the declarative part may be empty (zero repetitions of block_declarative_item)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdp_empty_ent is
  port(a : in bit; y : out bit);
end entity;
architecture bh of bdp_empty_ent is
begin
  b_empty : block
  begin
    y <= a;
  end block;
end architecture bh;
