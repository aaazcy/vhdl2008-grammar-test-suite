-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: missing "block" keyword after label:colon — a label_colon is followed directly by "begin" without the required "block" keyword
-- Expected Result: Triggers syntax error: missing "block" keyword
-- Dependencies: None
-- =============================================================
entity blk_snn2_ent is
  port(a : in bit; y : out bit);
end entity blk_snn2_ent;
architecture bh of blk_snn2_ent is
begin
  -- ERROR: label:col followed by begin, missing "block" keyword
  blk_bad :
  begin
    y <= a;
  end block;
end architecture bh;
