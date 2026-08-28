-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive
-- Test Focus: Using generic constants to compute the disconnect time_expression - the disconnection delay is composed of a generic parameter and a local constant, verifying the time expression supports generic references
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dcspec_generic_time is
  generic(G_DELAY_BASE : time := 4 ns);
  port(a : in bit; y : out bit);
end entity;

architecture rtl of dcspec_generic_time is
  function f_resolve_b(v : bit_vector) return bit is
  begin
    for i in v'range loop if v(i) = '1' then return '1'; end if; end loop;
    return '0';
  end function f_resolve_b;
  subtype r_bit is f_resolve_b bit;
  signal s_g : r_bit register;
  constant C_EXTRA : time := 1 ns;
  disconnect s_g : r_bit after G_DELAY_BASE + C_EXTRA;
begin
  b_guard : block (a = '1')
  begin
    s_g <= guarded a;
    y <= s_g;
  end block;
end architecture rtl;
