-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: misspelled "block" keyword as "blok" — the keyword after label:colon is not the reserved word "block", violating the required keyword token
-- Expected Result: Triggers syntax error: unrecognized keyword
-- Dependencies: None
-- =============================================================
entity blk_snn8_ent is
  port(a : in bit; y : out bit);
end entity blk_snn8_ent;
architecture bh of blk_snn8_ent is
begin
  -- ERROR: "blok" is not the reserved word "block"
  blk_bad : blok
  begin
    y <= a;
  end block blk_bad;
end architecture bh;
