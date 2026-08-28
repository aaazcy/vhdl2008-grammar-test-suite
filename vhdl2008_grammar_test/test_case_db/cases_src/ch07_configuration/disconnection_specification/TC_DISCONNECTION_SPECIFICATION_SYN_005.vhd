-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive
-- Test Focus: Using the "all" keyword in place of a signal list - testing the "all" branch of guarded_signal_list, applying a uniform disconnection delay to all guarded signals within the block
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dcspec_all_sigs is
  port(clk : in bit; d0,d1 : in bit; q0,q1 : out bit);
end entity;

architecture rtl of dcspec_all_sigs is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_latch0 : r_bit register;
  signal s_latch1 : r_bit register;
  disconnect all : r_bit after 12 ns;
begin
  b_storage : block (clk = '1')
  begin
    s_latch0 <= guarded d0;
    s_latch1 <= guarded d1;
    q0 <= s_latch0;
    q1 <= s_latch1;
  end block;
end architecture rtl;
