-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: missing "begin" inside block body — a concurrent signal assignment appears directly in the block statement part without the required "begin" keyword
-- Expected Result: Triggers syntax error: missing "begin" keyword
-- Dependencies: None
-- =============================================================
entity blk_snn3_ent is
  port(a : in bit; y : out bit);
end entity blk_snn3_ent;
architecture bh of blk_snn3_ent is
begin
  -- ERROR: block has no "begin" before concurrent statement
  blk_bad : block
    y <= a;
  end block blk_bad;
end architecture bh;
