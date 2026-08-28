-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SEM_001
-- Related Rule ID: SEM_DISCONNE_001
-- Rule Type: Semantic
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic disconnect timing — verifies that the disconnect specification correctly establishes the implicit disconnection time for guarded signals, with multiple disconnect specs at different time values
-- Expected Result: Compiles successfully; disconnect semantics are correctly established
-- Dependencies: None
-- =============================================================
entity dcspec_sem_timing is
  port(a,b : in bit; y1,y2 : out bit);
end entity;

architecture bh of dcspec_sem_timing is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_fast : r_bit register;
  signal s_slow : r_bit register;
  disconnect s_fast : r_bit after 2 ns;
  disconnect s_slow : r_bit after 8 ns;
  function f_buf(x : bit) return bit is
  begin return x; end function;
  signal s_comb : bit;
begin
  b_fast : block (a = '1')
  begin
    s_fast <= guarded a;
    y1 <= s_fast;
  end block;
  b_slow : block (b = '1')
  begin
    s_slow <= guarded b;
    y2 <= s_slow;
  end block;
  s_comb <= f_buf(a);
end architecture bh;
