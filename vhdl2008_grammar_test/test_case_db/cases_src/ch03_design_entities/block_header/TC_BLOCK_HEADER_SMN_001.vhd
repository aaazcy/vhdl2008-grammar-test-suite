-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: SMN: block header generic default value is negative but the type is positive — the generic declaration type natural does not allow a negative default value
-- Expected Result: Triggers semantic error: default value out of subtype range
-- Dependencies: None
-- =============================================================
entity bhdr_smn1_ent is
  port(a : in bit; y : out bit);
end entity;
architecture bh of bhdr_smn1_ent is
begin
  b_bad : block
    generic(G_INDEX : natural := -1);
  begin
    y <= a;
  end block;
end architecture bh;
