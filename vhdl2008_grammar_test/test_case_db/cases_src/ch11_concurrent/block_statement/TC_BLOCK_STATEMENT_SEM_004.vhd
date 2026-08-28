-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SEM_004
-- Rule Type: Semantic
-- Related Rule ID: SEM_BLOCK_GENERIC
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Rule Description: Block generic constants are type-checked against generic_map_aspect — the generic map value must match the declared generic type
-- Case Type: Positive
-- Error Category: none
-- Test Focus: block with a positive generic delays signal propagation by g_delay ns; generic map provides a time-typed actual, verifying type-correct generic propagation in block_header
-- Expected Result: Compiles successfully; g_delay=3ns propagates to internal assignment
-- Dependencies: None
-- =============================================================
entity blk_sem4_ent is
  port(a, b : in bit; y : out bit);
end entity blk_sem4_ent;
architecture beh of blk_sem4_ent is
begin
  blk_dly : block is
    generic(g_delay : time := 1 ns);
    generic map(g_delay => 3 ns);
  begin
    y <= a xor b after g_delay;
  end block blk_dly;
end architecture beh;
