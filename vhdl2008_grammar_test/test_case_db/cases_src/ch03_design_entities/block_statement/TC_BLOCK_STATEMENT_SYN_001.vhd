-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: minimal block: no guard, no header, no declarative part, only a single concurrent assignment `y<=a`, end block with label, verifying the minimal compilable form of block_statement in the architecture statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_min_ent is port(a:in bit; y:out bit); end entity;
architecture bh of blk_min_ent is
begin
  b_simple:block
  begin
    y<=a;
  end block b_simple;
end architecture bh;
