-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block_statement_part with multiple concurrent signal assignments (simple, conditional, selected) feeding output
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_mstmt_ent is
  port(a, b, c : in bit; sel : in bit_vector(1 downto 0); y0, y1, y2 : out bit);
end entity blk_mstmt_ent;
architecture beh of blk_mstmt_ent is
begin
  blk_gates : block is
    signal s_and, s_or, s_sel : bit;
  begin
    s_and <= a and b;
    s_or  <= b or c;
    with sel select
      s_sel <= a when "00", b when "01", c when others;
    y0 <= s_and;
    y1 <= s_or;
    y2 <= s_sel;
  end block blk_gates;
end architecture beh;
