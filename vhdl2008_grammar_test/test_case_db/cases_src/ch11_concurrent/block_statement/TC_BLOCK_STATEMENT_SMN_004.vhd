-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SMN_004
-- Rule Type: Semantic
-- Related Rule ID: SMN_BLOCK_LABEL
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Test Focus: two block statements in the same architecture both use the identical label "blk_dup" — block labels in the same declarative region must be unique, and the second declaration conflicts with the first
-- Expected Result: Triggers semantic error: duplicate block label in same scope
-- Dependencies: None
-- =============================================================
entity blk_smn4_ent is
  port(a, b : in bit; y_and, y_or : out bit);
end entity blk_smn4_ent;
architecture bh of blk_smn4_ent is
begin
  blk_dup : block
  begin
    y_and <= a and b;
  end block blk_dup;
  blk_dup : block
  begin
    y_or <= a or b;
  end block blk_dup;
end architecture bh;
