-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive
-- Test Focus: Disconnection specification with computed time_expression — exercises "after" clause with an arithmetic time expression (not just a literal), verifying time_expression grammar within disconnect
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dcspec_computed_time is
  port(a,b : in bit; y : out bit);
end entity;

architecture bh of dcspec_computed_time is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_g : r_bit register;
  constant C_BASE_DELAY : time := 3 ns;
  disconnect s_g : r_bit after C_BASE_DELAY + 2 ns;
begin
  b_guard : block (a = '1')
  begin
    s_g <= guarded a or b;
    y <= s_g;
  end block;
end architecture bh;
