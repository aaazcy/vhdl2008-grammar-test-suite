-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: SNN: generic_map_aspect in the block header maps a nonexistent generic name — generic_map references a name not declared in generic_clause
-- Expected Result: Triggers semantic error: generic not found in generic map
-- Dependencies: None
-- =============================================================
entity bhdr_snn6_ent is
  port(a : in bit; y : out bit);
end entity;
architecture bh of bhdr_snn6_ent is
begin
  b_bad : block
    generic(G_DLY : time := 1 ns);
    generic map(NONEXISTENT => 5 ns);
  begin
    y <= a after G_DLY;
  end block;
end architecture bh;
