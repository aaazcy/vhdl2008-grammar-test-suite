-- =============================================================
-- Case ID: TC_BLOCK_HEADER_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: SNN: generic_clause in the block header missing the closing parenthesis — generic(WIDTH:integer:=8 lacks ")", verifying that generic_clause must be properly closed
-- Expected Result: Triggers syntax error: ")" expected in generic clause
-- Dependencies: None
-- =============================================================
entity bhdr_snn5_ent is
  port(x : in bit; z : out bit);
end entity;
architecture bh of bhdr_snn5_ent is
begin
  b_bad : block
    generic(G_DELAY : time := 1 ns
  begin
    z <= x;
  end block;
end architecture bh;
