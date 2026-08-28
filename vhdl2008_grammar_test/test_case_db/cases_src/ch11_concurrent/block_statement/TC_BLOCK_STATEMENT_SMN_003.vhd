-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SMN_BLOCK_GUARD
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: guard_expression must be boolean but an integer literal is provided — block(1) uses an integer expression where the implicit GUARD signal requires a boolean, triggering a type mismatch at analysis
-- Expected Result: Triggers semantic error: guard expression must be boolean type
-- Dependencies: None
-- =============================================================
entity blk_smn3_ent is
  port(a : in bit; y : out bit);
end entity blk_smn3_ent;
architecture bh of blk_smn3_ent is
  signal s_r : bit register;
begin
  blk_bad : block(1)
  begin
    s_r <= guarded a;
    y   <= s_r;
  end block blk_bad;
end architecture bh;
