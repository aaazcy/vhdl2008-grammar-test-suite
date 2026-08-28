-- =============================================================
-- Case ID: TC_BLOCK_STATEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_BLOCK_GUARD
-- Standard Reference: IEEE 1076-2008 Section 11.2
-- Rule Description: Guard expression controls guarded signal assignments — when guard is true the guarded assignment drives the signal; when false the signal retains its previous value (register semantics)
-- Case Type: Positive
-- Error Category: none
-- Test Focus: block with guard expression driving a register-kind signal through guarded assignment, verifying that guarded keyword disconnects driver when guard condition is false
-- Expected Result: Compiles successfully; guarded signal s_q only updates when en='1'
-- Dependencies: None
-- =============================================================
entity blk_sem1_ent is
  port(d, en : in bit; q : out bit);
end entity blk_sem1_ent;
architecture beh of blk_sem1_ent is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_latch : r_bit register;
begin
  blk_g_latch : block(en = '1')
  begin
    s_latch <= guarded d;
    q       <= s_latch;
  end block blk_g_latch;
end architecture beh;
