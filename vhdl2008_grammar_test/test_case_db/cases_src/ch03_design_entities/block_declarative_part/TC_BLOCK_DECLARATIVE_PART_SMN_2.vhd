-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SEM: signal name conflicts with port name in the block declarative part — the block signal s_clk has the same name as an external entity port, causing hiding and possibly ambiguous references
-- Expected Result: Triggers semantic error: declaration hides entity port
-- Dependencies: None
-- =============================================================
entity bdp_sem1_ent is
  port(data : in integer; s_result : out integer);
end entity;
architecture bh of bdp_sem1_ent is
  signal s_result : integer := 0;
begin
  b_bad : block
    signal s_result : integer := 0;
  begin
    s_result <= data;
  end block;
end architecture bh;
