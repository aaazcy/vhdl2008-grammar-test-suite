-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive
-- Test Focus: Disconnection specification with "others" guarded signal list — exercises the "others" alternative of the guarded_signal_list within the disconnect specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dcspec_others is
  port(a,b,c : in bit; y1,y2,y3 : out bit);
end entity;

architecture bh of dcspec_others is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_g1, s_g2, s_g3 : r_bit register;
  disconnect others : r_bit after 3 ns;
  disconnect s_g1 : r_bit after 8 ns;
begin
  b_guard : block (c = '1')
  begin
    s_g1 <= guarded a;
    s_g2 <= guarded b;
    s_g3 <= guarded c;
    y1 <= s_g1; y2 <= s_g2; y3 <= s_g3;
  end block;
end architecture bh;
