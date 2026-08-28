-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: SEM: block header generic_map actual value type is incompatible with the generic declaration type — the generic is declared as integer but generic_map provides a time value
-- Expected Result: Triggers semantic error: generic map actual type mismatch
-- Dependencies: None
-- =============================================================
entity bhdr_sem1_ent is
  port(d : in bit; q : out bit);
end entity;
architecture bh of bhdr_sem1_ent is
begin
  b_bad : block
    generic(G_WIDTH : integer := 8);
    generic map(G_WIDTH => 5 ns);
  begin
    q <= d;
  end block;
end architecture bh;
