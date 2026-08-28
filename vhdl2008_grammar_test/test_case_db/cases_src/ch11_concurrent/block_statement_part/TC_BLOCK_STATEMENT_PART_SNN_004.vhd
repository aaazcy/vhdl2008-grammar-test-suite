-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Negative
-- Test Focus: SNN: a sequential statement appears in block_statement_part — an `if` statement appears directly in the block body without being wrapped in a process, verifying that the block statement part allows only concurrent statements, so sequential statements must be nested inside a process
-- Expected Result: Triggers syntax error: sequential statement not allowed directly in block_statement_part
-- Dependencies: None
-- =============================================================
entity blk_part_snn4_ent is
  port(clk : in bit; d : in bit; q : out bit);
end entity blk_part_snn4_ent;
architecture bh of blk_part_snn4_ent is
begin
  blk_seq : block is
  begin
    if clk'event and clk = '1' then
      q <= d;
    end if;
  end block blk_seq;
end architecture bh;
