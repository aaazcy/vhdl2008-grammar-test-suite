-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_018
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: All block header combinations: 4 blocks use (no header), (generic only), (port only), and (generic+port combined) respectively, verifying all 4 combinations of the block_statement block_header compile in the architecture statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_blkhdr_ent is
  port(a,b:in bit; y1,y2,y3,y4:out bit);
end entity;
architecture rtl of arch_blkhdr_ent is
  signal s_i1,s_i2:bit;
begin
  b_no_hdr:block
  begin y1<=a and b; end block;
  b_gen:block
    generic(G_DLY:time:=1 ns);
    generic map(G_DLY=>2 ns);
  begin y2<=a or b after G_DLY; end block;
  b_port:block
    port(p_in:in bit; p_out:out bit);
    port map(p_in=>a, p_out=>y3);
  begin p_out<=not p_in; end block;
  b_full:block
    generic(G_W:integer:=1);
    generic map(G_W=>2);
    port(p_a:in bit; p_b:in bit; p_y:out bit);
    port map(p_a=>a, p_b=>b, p_y=>y4);
  begin p_y<=p_a xor p_b; end block;
end architecture rtl;
