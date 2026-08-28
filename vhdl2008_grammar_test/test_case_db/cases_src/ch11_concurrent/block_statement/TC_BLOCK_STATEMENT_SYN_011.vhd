-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: nested blocks: outer block declares signal, inner block uses that signal via a concurrent assignment, verifying block_statement can appear inside another block_statement_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_nest_ent is
  port(a, b : in bit; y : out bit);
end entity blk_nest_ent;
architecture beh of blk_nest_ent is
begin
  blk_outer : block is
    signal s_mid : bit;
  begin
    blk_inner : block
    begin
      s_mid <= a and b after 1 ns;
    end block blk_inner;
    y <= s_mid;
  end block blk_outer;
end architecture beh;
