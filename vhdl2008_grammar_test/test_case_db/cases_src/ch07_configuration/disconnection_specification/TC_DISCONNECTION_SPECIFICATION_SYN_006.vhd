-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Positive
-- Test Focus: Using a disconnect specification for a guarded signal of array type - the type_mark is std_logic_vector, verifying the type mark in disconnect supports composite (array) types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dcspec_array_type is
  port(en : in bit; din : in bit_vector(3 downto 0); dout : out bit_vector(3 downto 0));
end entity;

architecture rtl of dcspec_array_type is
  type t_arr_4 is array (natural range <>) of bit_vector(3 downto 0);
  function f_resolve_bv(v : t_arr_4) return bit_vector is
    variable res : bit_vector(3 downto 0) := (others => '0');
  begin
    for i in v'range loop res := res or v(i); end loop;
    return res;
  end function f_resolve_bv;
  subtype r_bv4 is f_resolve_bv bit_vector(3 downto 0);
  signal s_bus_hold : r_bv4 register;
  disconnect s_bus_hold : r_bv4 after 7 ns;
begin
  b_bus : block (en = '1')
  begin
    s_bus_hold <= guarded din;
    dout <= s_bus_hold;
  end block;
end architecture rtl;
