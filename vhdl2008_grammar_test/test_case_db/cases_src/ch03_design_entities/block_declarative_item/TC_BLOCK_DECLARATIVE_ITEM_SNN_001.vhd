-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Case Type: Negative
-- Test Focus: SNN: duplicate identifier in the block declarative part — two signals with the same name s_dup conflict
-- Expected Result: Triggers error: duplicate identifier in block
-- Dependencies: None
-- =============================================================
entity bdi_snn1_ent is port(a:in bit); end entity;
architecture bh of bdi_snn1_ent is
begin
  b_bad:block
    signal s_dup:bit:='0'; signal s_dup:bit:='1';
  begin end block;
end architecture bh;
