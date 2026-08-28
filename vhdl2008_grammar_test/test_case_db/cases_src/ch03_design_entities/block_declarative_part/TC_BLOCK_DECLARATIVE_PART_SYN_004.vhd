-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: block_declarative_part with a single declaration item(signal): only one signal declaration in the block, verifying that a minimal non-empty declarative part (1 block_declarative_item) is legal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdp_single_ent is
  port(ctrl : in bit; led : out bit);
end entity;
architecture bh of bdp_single_ent is
begin
  b_single : block
    signal s_latch : bit;
  begin
    s_latch <= ctrl;
    led <= s_latch;
  end block;
end architecture bh;
