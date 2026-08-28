-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_BLOCK_GUARD
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Rule Description: Multiple guarded blocks in the same architecture each have independent implicit GUARD signals — the guard expression of one block does not affect guarded assignments in another block
-- Case Type: Positive
-- Error Category: none
-- Test Focus: two sibling blocks each with their own guard expression and register-kind target signal; verifies that each guard independently controls only its own guarded assignment without cross-interference
-- Expected Result: Compiles successfully; each block's guard operates independently
-- Dependencies: None
-- =============================================================
entity blk_sem2_ent is
  port(d1, d2, en1, en2 : in bit; q1, q2 : out bit);
end entity blk_sem2_ent;
architecture beh of blk_sem2_ent is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_r1 : r_bit register;
  signal s_r2 : r_bit register;
begin
  blk_a : block(en1 = '1')
  begin
    s_r1 <= guarded d1;
    q1   <= s_r1;
  end block blk_a;
  blk_b : block(en2 = '1')
  begin
    s_r2 <= guarded d2;
    q2   <= s_r2;
  end block blk_b;
end architecture beh;
