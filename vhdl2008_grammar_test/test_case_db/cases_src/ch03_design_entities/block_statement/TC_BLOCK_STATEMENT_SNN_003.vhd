-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "end block" — the block ends directly (EOF) after the statement `y<=a;` without an end block closure, verifying that a block must terminate with end block
-- Expected Result: Triggers syntax error: unclosed block
-- Dependencies: None
-- =============================================================
entity blk_snn3_ent is port(a:in bit; y:out bit); end entity;
architecture bh of blk_snn3_ent is
begin
  b_bad:block
  begin
    y<=a;
end architecture bh;
