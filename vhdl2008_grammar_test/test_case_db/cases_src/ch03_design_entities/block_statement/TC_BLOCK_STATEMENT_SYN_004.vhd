-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: Nested blocks: an outer block (no guard) contains an inner block (guarded), the inner block guard references an outer signal, inner and outer each have their own declarative part (signal), verifying blocks can nest with inner/outer scope isolation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_nest_ent is port(clk,a:in bit; y:out bit); end entity;
architecture bh of blk_nest_ent is
  signal s_gate:bit:='1';
begin
  b_outer:block
    signal s_inner:bit;
  begin
    s_inner<=a;
    b_inner:block(s_gate='1')
      signal s_out:bit;
    begin
      s_out<=guarded s_inner;
      y<=s_out;
    end block b_inner;
  end block b_outer;
end architecture bh;
