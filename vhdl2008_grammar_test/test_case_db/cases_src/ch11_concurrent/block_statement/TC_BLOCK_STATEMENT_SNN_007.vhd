-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: missing colon after block_label — the label identifier "blk_bad" appears immediately before "block" without the required ":" delimiter, violating the block_label : syntax
-- Expected Result: Triggers syntax error: missing colon after block label
-- Dependencies: None
-- =============================================================
entity blk_snn7_ent is
  port(a : in bit; y : out bit);
end entity blk_snn7_ent;
architecture bh of blk_snn7_ent is
begin
  -- ERROR: blk_bad lacks colon before block
  blk_bad block
  begin
    y <= a;
  end block blk_bad;
end architecture bh;
