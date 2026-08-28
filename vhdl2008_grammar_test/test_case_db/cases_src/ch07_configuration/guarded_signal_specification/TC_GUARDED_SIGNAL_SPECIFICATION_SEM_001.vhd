-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SEM_001
-- Related Rule ID: SEM_GUARDED_001
-- Rule Type: Semantic
-- BNF Production: GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic guarded signal disconnect timing with guarded blocks — verifies that guarded_signal_specification correctly identifies guarded signals within multiple guarded blocks for proper disconnect behavior
-- Expected Result: Compiles successfully; guarded signal disconnect semantics verified
-- Dependencies: None
-- =============================================================
entity gss_sem_blocks is
  port(a,b : in bit; y1,y2 : out bit);
end entity;

architecture bh of gss_sem_blocks is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_fast : r_bit register;
  signal s_slow : r_bit register;
  disconnect s_fast : r_bit after 2 ns;
  disconnect s_slow : r_bit after 10 ns;
  function f_buf(x:bit) return bit is begin return x; end function;
begin
  b_fast : block (a = '1')
  begin
    s_fast <= guarded a;
    y1 <= s_fast;
  end block;
  b_slow : block (b = '1')
  begin
    s_slow <= guarded b;
    y2 <= f_buf(s_slow);
  end block;
end architecture bh;
