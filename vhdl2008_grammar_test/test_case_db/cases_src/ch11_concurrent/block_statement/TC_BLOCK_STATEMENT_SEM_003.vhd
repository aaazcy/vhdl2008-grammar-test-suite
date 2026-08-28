-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SEM_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_BLOCK_SCOPE
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Rule Description: Signal declared in an outer block is visible within nested inner blocks — the inner block_statement_part can reference signals declared in the outer block_declarative_part
-- Case Type: Positive
-- Error Category: none
-- Test Focus: outer block declares a signal; inner nested block reads and writes that signal through concurrent assignments, verifying inter-block signal visibility across nesting levels
-- Expected Result: Compiles successfully; inner block sees outer block's signal
-- Dependencies: None
-- =============================================================
entity blk_sem3_ent is
  port(a, b, sel : in bit; y : out bit);
end entity blk_sem3_ent;
architecture beh of blk_sem3_ent is
begin
  blk_outer : block is
    signal s_mux : bit;
  begin
    blk_inner : block
    begin
      s_mux <= a when sel = '1' else b;
    end block blk_inner;
    y <= s_mux after 1 ns;
  end block blk_outer;
end architecture beh;
