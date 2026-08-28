-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block_header with port_clause+port_map_aspect: block ports connect arch signals to block-internal logic via port map
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_port_ent is
  port(a, b : in bit; y : out bit);
end entity blk_port_ent;
architecture beh of blk_port_ent is
  signal s_in1, s_in2 : bit;
  signal s_out        : bit;
begin
  s_in1 <= a;
  s_in2 <= b;
  blk_gate : block is
    port(p_a : in bit; p_b : in bit; p_y : out bit);
    port map(p_a => s_in1, p_b => s_in2, p_y => s_out);
  begin
    p_y <= p_a and p_b after 1 ns;
  end block blk_gate;
  y <= s_out;
end architecture beh;
