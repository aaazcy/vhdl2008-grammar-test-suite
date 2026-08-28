-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SYN_014
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Production: block_statement ::= block_label : block [ ( guard_expression ) ] [ is ] block_header block_declarative_part begin block_statement_part end block [ block_label ] ;
-- Case Type: Positive
-- Test Focus: two sibling blocks with different configurations: one with guard+declarative, one plain; both independently drive outputs via their own signal scopes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity blk_sibl_ent is
  port(d1, d2, en, clk : in bit; q1, q2 : out bit);
end entity blk_sibl_ent;
architecture beh of blk_sibl_ent is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_q1 : r_bit register;
begin
  blk_latch : block(en = '1') is
    signal s_int : bit;
  begin
    s_int <= d1;
    s_q1  <= guarded s_int;
    q1    <= s_q1;
  end block blk_latch;
  blk_ff : block is
    signal s_ff : bit := '0';
  begin
    process(clk)
    begin
      if clk'event and clk = '1' then
        s_ff <= d2;
      end if;
    end process;
    q2 <= s_ff;
  end block blk_ff;
end architecture beh;
