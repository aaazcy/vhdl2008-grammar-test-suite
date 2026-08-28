-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_PART_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_part ::= { block_declarative_item }
-- Case Type: Negative
-- Test Focus: SMN: use_clause in the block declarative part references a nonexistent library — invalid library name in the use clause
-- Expected Result: Triggers semantic error: library not found in use clause
-- Dependencies: None
-- =============================================================
entity bdp_smn3_ent is
  port(a : in bit; y : out bit);
end entity;
architecture bh of bdp_smn3_ent is
begin
  b_bad : block
    use nonexistent_lib.all;
  begin
    y <= a;
  end block;
end architecture bh;
