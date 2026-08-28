-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing block_label — `block begin y<=a; end block;`, the required label identifier and colon before the block keyword are missing, verifying that the block_label of block_statement is a mandatory syntactic element (unlike the optional process label)
-- Expected Result: Triggers syntax error: missing block label
-- Dependencies: None
-- =============================================================
entity blk_snn1_ent is port(a:in bit; y:out bit); end entity;
architecture bh of blk_snn1_ent is
begin
  block begin y<=a; end block;
end architecture bh;
