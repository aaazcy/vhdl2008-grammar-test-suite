-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: SNN: generic_clause in the block header missing the "generic" keyword — the parameter list is written directly without the leading generic keyword, verifying that in the BNF generic_clause must start with generic
-- Expected Result: Triggers syntax error: "generic" keyword expected
-- Dependencies: None
-- =============================================================
entity bhdr_snn4_ent is
  port(a : in bit; y : out bit);
end entity;
architecture bh of bhdr_snn4_ent is
begin
  b_bad : block
    (G_SIZE : integer := 8)
  begin
    y <= a;
  end block;
end architecture bh;
