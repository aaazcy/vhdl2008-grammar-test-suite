-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: a block contains a component instantiation — verifying that block_statement_part may include a component instantiation as a concurrent statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_part_inst_ent is
  port(a, b : in bit; sum, carry : out bit);
end entity blk_part_inst_ent;

entity half_adder is
  port(x, y : in bit; s, c : out bit);
end entity half_adder;
architecture dataflow of half_adder is
begin
  s <= x xor y;
  c <= x and y;
end architecture dataflow;

architecture struct of blk_part_inst_ent is
  signal s_hs, s_hc : bit;
begin
  blk_hier : block is
  begin
    ha_inst : entity work.half_adder
      port map(x => a, y => b, s => s_hs, c => s_hc);
    sum   <= s_hs;
    carry <= s_hc;
  end block blk_hier;
end architecture struct;
