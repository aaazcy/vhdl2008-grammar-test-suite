-- =============================================================
-- Case ID: TC_ACTUAL_PART_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator
--              | function_name ( actual_designator )
--              | type_mark ( actual_designator )
-- Case Type: Negative
-- Test Focus: actual_part — ERROR: function_name form is missing the
--             closing parenthesis. The BNF requires:
--               function_name ( actual_designator )
--             Missing the ')' makes this an invalid actual_part.
-- Expected Result: Triggers syntax error (unmatched parenthesis)
-- Dependencies: None
-- =============================================================

entity actual_part_snn1 is
  port (
    a : in  integer;
    b : out integer
  );
end entity actual_part_snn1;

architecture arch of actual_part_snn1 is

  component inc_reg is
    port (
      value_in  : in  integer;
      value_out : out integer
    );
  end component;

  function add_one(x : integer) return integer is
  begin
    return x + 1;
  end function add_one;

  signal s_val : integer := 0;

begin

  -- ERROR: missing closing parenthesis after the actual_designator.
  -- The BNF requires: function_name ( actual_designator )
  -- add_one(a is missing the closing ')'
  u_reg : component inc_reg
    port map (
      value_in  => add_one(a,
      value_out => s_val
    );

  b <= s_val;

end architecture arch;
