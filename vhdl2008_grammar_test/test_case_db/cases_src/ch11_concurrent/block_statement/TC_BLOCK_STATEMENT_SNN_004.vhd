-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: missing "end block" — block body opens with begin and has a concurrent assignment but the closing "end block" is omitted, leaving the block unclosed at architecture end
-- Expected Result: Triggers syntax error: missing "end block"
-- Dependencies: None
-- =============================================================
entity blk_snn4_ent is
  port(a : in bit; y : out bit);
end entity blk_snn4_ent;
architecture bh of blk_snn4_ent is
begin
  -- ERROR: block never closed, "end block" missing
  blk_bad : block
  begin
    y <= a;
end architecture bh;
