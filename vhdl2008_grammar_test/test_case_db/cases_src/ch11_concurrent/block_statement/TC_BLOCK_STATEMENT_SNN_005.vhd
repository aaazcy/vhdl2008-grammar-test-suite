-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: label mismatch at end block — opening label is "blk_a" but closing label at "end block" is "blk_b", violating the optional_label must match rule
-- Expected Result: Triggers syntax error: block label mismatch
-- Dependencies: None
-- =============================================================
entity blk_snn5_ent is
  port(a : in bit; y : out bit);
end entity blk_snn5_ent;
architecture bh of blk_snn5_ent is
begin
  -- ERROR: opening label blk_a but closing label blk_b
  blk_a : block
  begin
    y <= a;
  end block blk_b;
end architecture bh;
