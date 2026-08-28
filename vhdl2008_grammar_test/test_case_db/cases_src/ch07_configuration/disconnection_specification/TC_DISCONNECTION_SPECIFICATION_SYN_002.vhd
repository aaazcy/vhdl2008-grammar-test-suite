-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive
-- Test Focus: Disconnection specification with multiple guarded signals in comma-separated list — exercises the guarded_signal_list repetition in guarded_signal_specification with different time expressions
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dcspec_multi_signal is
  port(a,b : in bit; y1,y2 : out bit);
end entity;

architecture bh of dcspec_multi_signal is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_g1, s_g2 : r_bit register;
  disconnect s_g1, s_g2 : r_bit after 10 ns;
begin
  b_guard : block (a = '1')
  begin
    s_g1 <= guarded a;
    s_g2 <= guarded b;
    y1 <= s_g1; y2 <= s_g2;
  end block;
end architecture bh;
