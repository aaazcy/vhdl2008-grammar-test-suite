-- =============================================================
-- Case ID: TC_RANGE_SEM_002
-- Related Rule ID: SEM_RANGE_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Range_attribute_name used where the prefix object
--   does not have a range attribute (e.g., integer signal). The
--   T'range attribute is only defined for array types and
--   constrained types; applying to a scalar signal is invalid.
-- Expected Result: Compilation error: no range attribute for scalar
-- Dependencies: None
-- =============================================================
entity range_scalar_attr_error is
  port (
    val : out integer
  );
end entity range_scalar_attr_error;

architecture scalar_no_range of range_scalar_attr_error is
  signal s_int : integer := 5;
begin
  process
    variable v : integer;
  begin
    -- ERROR: s_int is integer (scalar), no 'range attribute
    for i in s_int'range loop
      v := v + i;
    end loop;
    val <= v;
    wait;
  end process;
end architecture scalar_no_range;
