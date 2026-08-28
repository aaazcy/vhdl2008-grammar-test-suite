-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: block_statement with nested concurrent statements - statement part contains one top-level block_statement, the block nests two concurrent statements (concurrent_signal_assignment + concurrent_assertion), block_specification has a guard expression, verifying a block as concurrent_statement can contain arbitrary nested concurrent statements in the architecture statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_block_ent is port(clk,a:in bit; y:out bit); end entity;
architecture bh of asp_block_ent is
  signal s_g:bit;
begin
  s_g<=clk and a;
  blk_guarded:block(s_g='1')
  begin
    y<=guarded a;
    assert not(a'event) report "a toggled while guarded" severity note;
  end block blk_guarded;
end architecture bh;
