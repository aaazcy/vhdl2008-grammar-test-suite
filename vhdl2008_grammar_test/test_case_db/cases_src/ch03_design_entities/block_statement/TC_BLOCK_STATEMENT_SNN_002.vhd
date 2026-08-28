-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing "begin" — the block has a declarative part (signal) but lacks the begin keyword separating the declarative part and the statement part, verifying that block syntax requires begin to clearly separate declarative_part and statement_part
-- Expected Result: Triggers syntax error: missing "begin" in block
-- Dependencies: None
-- =============================================================
entity blk_snn2_ent is port(a:in bit; y:out bit); end entity;
architecture bh of blk_snn2_ent is
begin
  b_bad:block
    signal s:bit;
    s<=a; y<=s;
  end block b_bad;
end architecture bh;
