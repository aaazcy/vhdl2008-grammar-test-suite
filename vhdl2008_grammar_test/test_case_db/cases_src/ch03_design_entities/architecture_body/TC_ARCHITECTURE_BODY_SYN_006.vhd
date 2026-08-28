-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: blocks: simple block, guarded block, nested blocks
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_block_ent is port(a,b:in bit; y:out bit); end entity;
architecture rtl of arch_block_ent is
  signal s_g:bit:='1';
  signal s_a,s_b:bit;
begin
  b_input:block begin s_a<=a; s_b<=b; end block b_input;
  b_guarded:block(s_g='1')
    signal s_gated:bit;
  begin s_gated<=guarded s_a and s_b; y<=s_gated; end block b_guarded;
  b_outer:block
    signal s_o:bit;
  begin
    s_o<=a xor b;
    b_inner:block signal s_i:bit; begin s_i<=s_o and s_g; y<=s_i when s_g='1' else '0'; end block b_inner;
  end block b_outer;
end architecture rtl;
