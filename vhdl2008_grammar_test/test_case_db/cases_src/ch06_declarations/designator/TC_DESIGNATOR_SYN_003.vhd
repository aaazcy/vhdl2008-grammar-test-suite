-- =============================================================
-- Case ID: TC_DESIGNATOR_SYN_003
-- Rule Type: Syntax
-- BNF Production: DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: designator ::= identifier | operator_symbol
-- Test Focus: Operator_symbol form of designator —
--   overloads "+" (addition), "*" (multiplication), and
--   "=" (equality) operators for a custom vector type,
--   then uses them in expressions. Exercises the
--   operator_symbol alternative of the designator production.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity designator_syn_003 is
  port (
    vec_a   : in  bit_vector(3 downto 0);
    vec_b   : in  bit_vector(3 downto 0);
    sum_out : out bit_vector(4 downto 0);
    eq_out  : out bit
  );
end entity designator_syn_003;

architecture rtl of designator_syn_003 is
  type t_vec4 is array(3 downto 0) of bit;

  -- Overloaded "+" operator using operator_symbol designator
  function "+"(l, r : t_vec4) return bit_vector is
    variable result : bit_vector(4 downto 0) := (others => '0');
    variable carry  : bit := '0';
  begin
    for i in 0 to 3 loop
      result(i) := l(i) xor r(i) xor carry;
      carry := (l(i) and r(i)) or (l(i) and carry) or (r(i) and carry);
    end loop;
    result(4) := carry;
    return result;
  end function;

  -- Overloaded "=" operator using operator_symbol designator
  function "="(l, r : t_vec4) return bit is
  begin
    for i in 0 to 3 loop
      if l(i) /= r(i) then return '0'; end if;
    end loop;
    return '1';
  end function;

  -- Overloaded "*" operator (bitwise AND) using operator_symbol designator
  function "*"(l, r : t_vec4) return bit_vector is
    variable result : bit_vector(3 downto 0);
  begin
    for i in 0 to 3 loop
      result(i) := l(i) and r(i);
    end loop;
    return result;
  end function;

  signal s_a : t_vec4;
  signal s_b : t_vec4;
  signal s_and : bit_vector(3 downto 0);
begin
  s_a <= t_vec4(vec_a);
  s_b <= t_vec4(vec_b);

  -- Call overloaded "+" using operator_symbol as designator
  sum_out <= s_a + s_b;

  -- Call overloaded "=" using operator_symbol as designator
  eq_out <= s_a = s_b;

  -- Call overloaded "*" using operator_symbol as designator
  s_and <= s_a * s_b;
end architecture rtl;
