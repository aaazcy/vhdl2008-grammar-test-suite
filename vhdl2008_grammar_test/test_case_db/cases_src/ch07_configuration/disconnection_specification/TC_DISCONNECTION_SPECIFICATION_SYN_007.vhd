-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive
-- Test Focus: time_expression computed via a pure function call - the after clause of disconnect accepts a function call returning time as the time expression, verifying the expression syntax supports function evaluation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dcspec_func_time is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of dcspec_func_time is
  function f_discharge_delay return time is
  begin
    return 6 ns;
  end function;
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_guard : r_bit register;
  disconnect s_guard : r_bit after f_discharge_delay;
begin
  b_guard : block (a = '1')
  begin
    s_guard <= guarded a;
    y <= s_guard;
  end block;
end architecture rtl;
