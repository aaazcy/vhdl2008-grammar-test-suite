-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: missing "end" keyword — block is closed with just "block blk_bad;" instead of "end block blk_bad;", violating the required "end block" closing
-- Expected Result: Triggers syntax error: missing "end" before "block"
-- Dependencies: None
-- =============================================================
entity blk_snn9_ent is
  port(a : in bit; y : out bit);
end entity blk_snn9_ent;
architecture bh of blk_snn9_ent is
begin
  -- ERROR: "end" missing, just "block" at closing
  blk_bad : block
  begin
    y <= a;
  block blk_bad;
end architecture bh;
