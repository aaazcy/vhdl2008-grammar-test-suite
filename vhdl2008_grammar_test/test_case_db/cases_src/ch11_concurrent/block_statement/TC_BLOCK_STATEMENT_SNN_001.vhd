-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: missing block_label identifier before colon — "block" keyword appears without preceding label:colon, violating the mandatory block_label : prefix
-- Expected Result: Triggers syntax error: missing block label
-- Dependencies: None
-- =============================================================
entity blk_snn1_ent is
  port(a : in bit; y : out bit);
end entity blk_snn1_ent;
architecture bh of blk_snn1_ent is
begin
  -- ERROR: missing block_label before block keyword
  block
  begin
    y <= a;
  end block;
end architecture bh;
