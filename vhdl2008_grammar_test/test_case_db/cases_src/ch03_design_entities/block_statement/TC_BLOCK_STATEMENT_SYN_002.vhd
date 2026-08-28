-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: Guarded block: contains guard_expression `(s_g='1')`, declarative part contains a signal, statement part contains guarded signal assignment + conditional signal assignment, verifying the guard expression of a guarded block controls internal signal driving
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_guard_ent is port(a,b:in bit; y:out bit); end entity;
architecture bh of blk_guard_ent is
  signal s_g:bit:='1';
begin
  b_g:block(s_g='1')
    signal s_and:bit;
  begin
    s_and<=guarded a and b;
    y<=s_and when s_g='1' else '0';
  end block b_g;
end architecture bh;
