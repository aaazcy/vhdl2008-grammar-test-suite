-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: a block contains a single concurrent signal assignment driving an entity output port — verifying the most typical use of block_statement_part: a concurrent signal assignment inside the block drives an external port
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_part_drive_ent is
  port(a : in bit; y : out bit);
end entity blk_part_drive_ent;
architecture bh of blk_part_drive_ent is
begin
  blk_drv : block is
    signal s_mid : bit;
  begin
    s_mid <= a;
    y <= s_mid;
  end block blk_drv;
end architecture bh;
