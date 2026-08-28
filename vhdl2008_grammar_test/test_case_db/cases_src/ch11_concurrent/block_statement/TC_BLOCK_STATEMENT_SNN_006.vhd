-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: missing closing parenthesis on guard_expression — opening paren present "(en='1'" but missing ")", violating the balanced-parens requirement of the optional guard_expression
-- Expected Result: Triggers syntax error: unmatched parenthesis in guard expression
-- Dependencies: None
-- =============================================================
entity blk_snn6_ent is
  port(a, en : in bit; y : out bit);
end entity blk_snn6_ent;
architecture bh of blk_snn6_ent is
begin
  -- ERROR: guard expression missing closing ")"
  blk_bad : block(en = '1'
  begin
    y <= a;
  end block blk_bad;
end architecture bh;
