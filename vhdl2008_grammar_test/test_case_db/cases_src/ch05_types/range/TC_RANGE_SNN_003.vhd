-- =============================================================
-- Case ID: TC_RANGE_SNN_003
-- Rule Type: Syntax (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Uses a malformed range_attribute_name with an invalid
--   suffix. The BNF only permits 'range and 'reverse_range as
--   valid attribute names in this production.
-- Expected Result: VHDL syntax error at invalid attribute
-- Dependencies: None
-- =============================================================
entity range_invalid_attribute is
end entity range_invalid_attribute;

architecture bad_attr of range_invalid_attribute is
  type t_arr is array(0 to 3) of bit;
  -- ERROR: 'length is not a valid range_attribute_name
  signal s : t_arr;
begin
  process
    variable v : integer;
  begin
    for i in s'length loop  -- 'length not valid in range position
      v := i;
    end loop;
    wait;
  end process;
end architecture bad_attr;
