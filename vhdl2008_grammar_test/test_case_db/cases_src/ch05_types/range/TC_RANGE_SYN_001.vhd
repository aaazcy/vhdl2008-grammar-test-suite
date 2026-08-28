-- =============================================================
-- Case ID: TC_RANGE_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Tests the range_attribute_name form using T'range on
--   a constrained array type. A for loop iterates over s_arr'range,
--   summing all elements. The range is derived from the attribute
--   rather than explicit bounds.
-- Expected Result: Compiles; sum of array elements = 6
-- Dependencies: None
-- =============================================================
entity range_attr_loop is
  port (
    trigger : in  bit;
    result  : out integer
  );
end entity range_attr_loop;

architecture attribute_range of range_attr_loop is
  type t_arr is array(0 to 5) of integer;
  signal s_arr : t_arr := (0, 1, 2, 3, 4, 5);
  signal s_sum : integer := 0;
begin
  process(trigger)
    variable v : integer := 0;
  begin
    if trigger = '1' then
      for i in s_arr'range loop
        v := v + s_arr(i);
      end loop;
      s_sum <= v;
    end if;
  end process;
  result <= s_sum;
end architecture attribute_range;
