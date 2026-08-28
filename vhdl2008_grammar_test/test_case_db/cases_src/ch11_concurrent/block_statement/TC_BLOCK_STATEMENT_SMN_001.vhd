-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_BLOCK_HEADER
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Negative
-- Error Category: type_elaboration_error
-- Test Focus: block_header declares a port_clause but omits port_map_aspect — a block with ports that have no connection to external signals is semantically invalid since block ports require mapping to architecture signals
-- Expected Result: Triggers semantic error: block ports declared but no port map
-- Dependencies: None
-- =============================================================
entity blk_smn1_ent is
  port(a : in bit; y : out bit);
end entity blk_smn1_ent;
architecture bh of blk_smn1_ent is
begin
  blk_bad : block is
    port(p_in : in bit; p_out : out bit);
  begin
    p_out <= not p_in after 1 ns;
  end block blk_bad;
  y <= a;
end architecture bh;
