-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block_header with generic_clause+generic_map_aspect: generic delay parameter propagates via generic map to block-internal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_gen_ent is
  port(a, b : in bit; y : out bit);
end entity blk_gen_ent;
architecture beh of blk_gen_ent is
begin
  blk_delayed : block is
    generic(g_delay : time := 1 ns);
    generic map(g_delay => 3 ns);
  begin
    y <= a and b after g_delay;
  end block blk_delayed;
end architecture beh;
