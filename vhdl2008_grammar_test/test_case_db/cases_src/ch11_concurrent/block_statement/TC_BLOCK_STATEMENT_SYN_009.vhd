-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block without optional "is" keyword — label+block+begin+assignment+end block, verifying [ is ] omission is valid
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_nois_ent is
  port(a : in bit; y : out bit);
end entity blk_nois_ent;
architecture beh of blk_nois_ent is
begin
  blk_dir : block
  begin
    y <= not a after 1 ns;
  end block blk_dir;
end architecture beh;
