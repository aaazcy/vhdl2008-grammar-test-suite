-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block_header with both generic_clause+generic_map_aspect and port_clause+port_map_aspect: generic sizes the port width, port map connects to architecture signals
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_both_ent is
  port(a : in bit_vector(3 downto 0); y : out bit_vector(3 downto 0));
end entity blk_both_ent;
architecture beh of blk_both_ent is
  signal s_in  : bit_vector(3 downto 0);
  signal s_out : bit_vector(3 downto 0);
begin
  s_in <= a;
  blk_buf : block is
    generic(g_w : positive := 4);
    generic map(g_w => 4);
    port(p_in : in bit_vector(g_w - 1 downto 0); p_out : out bit_vector(g_w - 1 downto 0));
    port map(p_in => s_in, p_out => s_out);
  begin
    p_out <= p_in after 2 ns;
  end block blk_buf;
  y <= s_out;
end architecture beh;
