-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: label mismatch after end block — `end block wrong_label`, where wrong_label != the declared label name b_ok, verifying the consistency check of block_label after end
-- Expected Result: Triggers syntax error: block label mismatch
-- Dependencies: None
-- =============================================================
entity blk_snn4_ent is port(a:in bit; y:out bit); end entity;
architecture bh of blk_snn4_ent is
begin
  b_ok:block
  begin
    y<=a;
  end block wrong_label;
end architecture bh;
