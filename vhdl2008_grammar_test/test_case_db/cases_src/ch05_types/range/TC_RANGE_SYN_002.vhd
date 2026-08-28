-- =============================================================
-- Case ID: TC_RANGE_SYN_002
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Tests the expression-direction-expression form with
--   literal integer bounds. Uses C_MIN to C_MAX with "to" direction
--   in a subtype declaration. Verifies range with constant expressions.
-- Expected Result: Compiles; counter wraps at bounds
-- Dependencies: None
-- =============================================================
entity range_expression_bounds is
  port (
    clk   : in  bit;
    count : out integer
  );
end entity range_expression_bounds;

architecture expr_direction_expr of range_expression_bounds is
  constant C_MIN : integer := 10;
  constant C_MAX : integer := 99;
  subtype t_counter is integer range C_MIN to C_MAX;
  signal counter : t_counter := 10;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if counter = C_MAX then
        counter <= C_MIN;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;
  count <= counter;
end architecture expr_direction_expr;
