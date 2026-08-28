-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: SEM: the same generic appears twice in a block header generic_map — the same generic is mapped twice, verifying that each generic can be mapped only once in a generic_map
-- Expected Result: Triggers semantic error: duplicate generic association
-- Dependencies: None
-- =============================================================
entity bhdr_sem2_ent is
  port(x : in bit; z : out bit);
end entity;
architecture bh of bhdr_sem2_ent is
begin
  b_bad : block
    generic(G_VAL : integer := 1);
    generic map(G_VAL => 2, G_VAL => 3);
  begin
    z <= x;
  end block;
end architecture bh;
