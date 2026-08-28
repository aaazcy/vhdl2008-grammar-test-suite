-- =============================================================
-- Case ID: TC_PREFIX_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PREFIX
-- Standard Reference: IEEE 1076-2008 Section 8.3
-- Production: prefix ::= name | function_call
-- Case Type: Positive
-- Test Focus: prefix as function_call — function_call used as prefix for further name resolution (attribute_name, indexed_name), testing prefix ::= function_call variant
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prefix_func_call_ent is
  port(vec_in : in bit_vector(7 downto 0); msb : out bit; lsb : out bit);
end entity;

architecture bh of prefix_func_call_ent is
  function f_reverse(v : bit_vector) return bit_vector is
    variable r : bit_vector(v'range);
  begin
    for i in v'range loop r(v'left - i) := v(i); end loop;
    return r;
  end function;
  signal vec_reg : bit_vector(7 downto 0) := X"00";
begin
  process(vec_in)
  begin
    vec_reg <= vec_in;
    msb <= f_reverse(vec_reg)(0);  -- prefix: function_call 'f_reverse(vec_reg)' then indexed
    lsb <= f_reverse(vec_reg)(7);  -- prefix: function_call 'f_reverse(vec_reg)' then indexed
  end process;
end architecture bh;
