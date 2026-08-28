-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SNN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Test Focus: reserved word "begin" used as block_label — "begin : block" uses the reserved word "begin" as a label identifier, which is illegal since begin is a VHDL reserved word
-- Expected Result: Triggers syntax error: reserved word used as identifier
-- Dependencies: None
-- =============================================================
entity blk_snn10_ent is
  port(a : in bit; y : out bit);
end entity blk_snn10_ent;
architecture bh of blk_snn10_ent is
begin
  -- ERROR: "begin" cannot be used as a block label
  begin : block
  begin
    y <= a;
  end block;
end architecture bh;
