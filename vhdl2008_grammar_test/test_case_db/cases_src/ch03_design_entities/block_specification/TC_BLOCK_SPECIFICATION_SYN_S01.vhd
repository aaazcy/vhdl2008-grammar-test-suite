-- =============================================================
-- Case ID: TC_BLOCK_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BLOCK_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Test Focus: Block specification: architecture_name ｜ block_label ｜ generate_label[(static_expression)]
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_block_specification_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_block_specification_syn_s01 is
begin
  r<=42;end architecture bh;
