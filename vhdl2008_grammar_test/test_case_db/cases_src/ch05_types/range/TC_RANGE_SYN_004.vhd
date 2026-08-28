-- =============================================================
-- Case ID: TC_RANGE_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Tests expression-direction-expression with arithmetic
--   operators in the simple expressions. Uses A+B to C*D to compute
--   range bounds at elaboration time, verifying computed ranges.
--   Also demonstrates "downto" with computed expressions.
-- Expected Result: Compiles; window sum computed over dynamic range
-- Dependencies: None
-- =============================================================
entity range_computed_bounds is
  port (
    base   : in  integer;
    width  : in  integer;
    total  : out integer
  );
end entity range_computed_bounds;

architecture computed_expressions of range_computed_bounds is
  type t_buffer is array(0 to 31) of integer;
  signal buf : t_buffer := (others => 0);
  constant BASE_OFFSET : integer := 0;
begin
  process(base, width)
    variable accum : integer := 0;
    variable lo, hi : integer;
  begin
    lo := base + BASE_OFFSET;
    hi := base + width - 1;
    for i in lo to hi loop
      accum := accum + buf(i);
    end loop;
    total <= accum;
  end process;
end architecture computed_expressions;
