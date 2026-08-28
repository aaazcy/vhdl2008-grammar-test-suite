-- =============================================================
-- Case ID: TC_RANGE_SYN_007
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Tests range_attribute_name with 'range on a subtype
--   that has been further constrained. The subtype's 'range reflects
--   the constraint, not the base type. Demonstrates chained
--   attribute use with range attribute names.
-- Expected Result: Compiles; subtype range used for iteration
-- Dependencies: None
-- =============================================================
entity range_subtype_attr is
  port (
    clk   : in  bit;
    value : out integer
  );
end entity range_subtype_attr;

architecture subtype_range_attr of range_subtype_attr is
  type t_base is array(natural range <>) of integer;
  subtype t_window is t_base(128 to 255);
  signal s_val : t_window := (others => 0);
begin
  process(clk)
    variable sum : integer := 0;
  begin
    if clk'event and clk = '1' then
      -- Iterate only over the subtype's constrained range
      for i in t_window'range loop
        sum := sum + i;
      end loop;
      value <= sum;
      s_val <= (others => 0);
    end if;
  end process;
end architecture subtype_range_attr;
