-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block with guard_expression using boolean signal + guarded signal assignment to a register-kind signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_guard_ent is
  port(d, en : in bit; q : out bit);
end entity blk_guard_ent;
architecture beh of blk_guard_ent is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_q : r_bit register;
begin
  blk_latch : block(en = '1')
  begin
    s_q <= guarded d;
    q   <= s_q;
  end block blk_latch;
end architecture beh;
