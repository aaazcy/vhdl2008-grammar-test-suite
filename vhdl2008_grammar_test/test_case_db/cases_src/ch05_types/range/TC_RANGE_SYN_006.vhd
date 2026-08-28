-- =============================================================
-- Case ID: TC_RANGE_SYN_006
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Tests expression-direction-expression with "downto"
--   using function calls as simple_expressions. The range bounds
--   are computed by functions, verifying that function-call
--   expressions are valid in the range production.
-- Expected Result: Compiles; descending priority scan
-- Dependencies: None
-- =============================================================
entity range_function_bounds is
  port (
    vec_in  : in  bit_vector(7 downto 0);
    msb_set : out integer
  );
end entity range_function_bounds;

architecture func_expr_range of range_function_bounds is
  function f_top return integer is
  begin return 7; end function;
  function f_bot return integer is
  begin return 0; end function;
begin
  process(vec_in)
  begin
    msb_set <= -1;
    for i in f_top downto f_bot loop
      if vec_in(i) = '1' then
        msb_set <= i;
        exit;
      end if;
    end loop;
  end process;
end architecture func_expr_range;
