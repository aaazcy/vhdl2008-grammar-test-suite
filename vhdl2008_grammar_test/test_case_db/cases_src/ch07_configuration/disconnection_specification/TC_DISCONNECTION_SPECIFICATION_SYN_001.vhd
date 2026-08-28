-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive
-- Test Focus: Disconnection specification with single guarded signal — exercises "disconnect signal_list : type_mark after time_expression ;" for one guarded signal in a guarded block
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dcspec_single is
  port(a : in bit; y : out bit);
end entity;

architecture bh of dcspec_single is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_guarded : r_bit register;
  disconnect s_guarded : r_bit after 5 ns;
begin
  b_guard : block (a = '1')
  begin
    s_guarded <= guarded a;
    y <= s_guarded;
  end block;
end architecture bh;
