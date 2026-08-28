-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_PART_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_BLOCK_PART_GUARD
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Rule Description: Guarded signal assignment in block requires guard condition
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SEM: guarded signal assignment in block without guard condition
-- Expected Result: Triggers semantic error: guarded assignment without guard
-- Dependencies: None
-- =============================================================
entity block_part_sem1_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of block_part_sem1_ent is
begin
  b1: block is
    signal s_t:integer bus:=0;
  begin
    s_t <= guarded 5;
    y<=s_t;
  end block;
end architecture bh;
