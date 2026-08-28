-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_012
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: nested blocks with independent guard_expressions: outer guard controls its guarded signal, inner guard independently controls its own guarded signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_nestg_ent is
  port(d1, d2, en1, en2 : in bit; q1, q2 : out bit);
end entity blk_nestg_ent;
architecture beh of blk_nestg_ent is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_q1 : r_bit register;
  signal s_q2 : r_bit register;
begin
  blk_outer : block(en1 = '1') is
  begin
    s_q1 <= guarded d1;
    q1   <= s_q1;
    blk_inner : block(en2 = '1') is
    begin
      s_q2 <= guarded d2;
      q2   <= s_q2;
    end block blk_inner;
  end block blk_outer;
end architecture beh;
