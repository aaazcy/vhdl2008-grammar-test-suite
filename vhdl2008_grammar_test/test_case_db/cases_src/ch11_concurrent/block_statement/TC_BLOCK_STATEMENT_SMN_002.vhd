-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_BLOCK_GUARD_TYPE
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: type error in the block guard_expression — in block (5) the guard_expression is an integer literal, but guard_expression must be of boolean type
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity blk_guard_int_ent is
  port(y : out bit);
end entity blk_guard_int_ent;
architecture vhdl2008 of blk_guard_int_ent is
begin
  blk_bad : block (5) is
  begin
    y <= '0';
  end block blk_bad;
end architecture vhdl2008;
