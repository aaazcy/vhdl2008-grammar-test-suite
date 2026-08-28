-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: block with compound boolean guard_expression(en and not rst) + guarded assignment to register signal + declarative_part with internal signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_cmpxg_ent is
  port(d, en, rst : in bit; q : out bit);
end entity blk_cmpxg_ent;
architecture beh of blk_cmpxg_ent is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_q : r_bit register;
begin
  blk_dffe : block(en = '1' and rst = '1') is
    signal s_mux : bit;
  begin
    s_mux <= d when en = '1' else s_q;
    s_q   <= guarded s_mux;
    q     <= s_q;
  end block blk_dffe;
end architecture beh;
